package top.pokergame.websocket;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import jakarta.annotation.PostConstruct;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import top.pokergame.entity.Room;
import top.pokergame.entity.User;
import top.pokergame.entity.WsUser;
import top.pokergame.service.IUserService;
import top.pokergame.util.Jwt;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.*;

@Component
@ServerEndpoint("/ws")
public class WebSocketEndpoint {

    @Autowired
    private Jwt jwt;

    private static Jwt jwtUtil; // 静态访问工具类

    @Autowired
    private IUserService userService; // 注入 UserService

    private static IUserService userServiceStatic; // 静态访问


    @PostConstruct
    public void init() {
        jwtUtil = this.jwt;
        userServiceStatic = this.userService;
    }

    // 存储所有连接用户（普通用户）
    private static Map<String, WsUser> userMap = new ConcurrentHashMap<>();

    // 存储管理员连接（仅用于发送系统消息）
    private static Map<String, WsUser> adminMap = new ConcurrentHashMap<>();

    // 存储房间的信息
    private static List<Room> roomList = new CopyOnWriteArrayList<>();

    // 心跳检测周期任务
    private static ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        try {
            // 获取 token 并验证
            String token = getTokenFromQuery(session);
            if (token == null || !validateToken(token, session)) {
                session.close(new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, "Token invalid"));
            }
            new Thread(() -> {
                try {
                    Thread.sleep(200); // 延迟 200ms
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                if (session.isOpen()) {
                    broadcastUserList();
                    broadcastRoomList();
                }
                else {
                    System.out.println("连接异常");
                }
            }).start();
            // 心跳
            startHeartbeat(session);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                session.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        // 处理加入/退出房间等指令
        JSONObject json = JSON.parseObject(message);
        String action = json.getString("action");
        JSONObject data = json.getJSONObject("data");
        switch (action) {
            case "update_data":
                // 前端初始化需要拿一次最新数据
                broadcastRoomList(session);
                broadcastUserList(session);
                break;
            case "create_room":
                createRoom(session, data);
                break;
            case "join_room":
                joinRoom(session, data);
                break;
            case "leave_room":
                leaveRoom(session, data);
                break;
            case "heart_beat":
                // 心跳检测，更新用户最后心跳时间
                WsUser wsUser = getWsUserBySession(session);
                if (wsUser != null) {
                    wsUser.updateHeartbeat();
                }
                break;
            case "start_game_request":
                startGame(session, data);
                break;
            default:
                break;
        }
    }

    @OnClose
    public void onClose(Session session) {
        String key = getKeyBySession(session);
        if (key != null) {
            System.out.println(key + "关闭连接");
            userMap.remove(key);
            adminMap.remove(key);
            broadcastUserList();
            broadcastRoomList();
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        throwable.printStackTrace();
        try {
            session.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 提取 token 方法
    private String getTokenFromQuery(Session session) {
        return session.getRequestParameterMap().get("token").stream().findFirst().orElse(null);
    }

    private void sendErrorMessage(Session session, String message) {
        JSONObject responseJson = new JSONObject();
        responseJson.put("action", "msg_error");
        responseJson.put("message", message);
        session.getAsyncRemote().sendText(responseJson.toJSONString());
    }

    // 校验 token 并存储用户信息
    private boolean validateToken(String token, Session session) {
        try {
            Map<String, Object> claims = jwtUtil.validateToken(token);
            Integer userId = (Integer) claims.get("userId");
            String username = (String) claims.get("username");

            System.out.println("validateToken userId " + claims.get("userId"));
            System.out.println("validateToken username " + claims.get("username"));

            // 查询数据库判断用户是否存在
            User user = userServiceStatic.getById(userId);
            if (user == null || !user.getUsername().equals(username)) {
                System.out.println("用户不存在或用户名不匹配");
                return false;
            }

            String key = "user:" + userId;

            // 检查是否已经有这个用户的连接
            if (userMap.containsKey(key) || adminMap.containsKey(key)) {
                WsUser existingUser = userMap.get(key);
                if (existingUser == null) {
                    existingUser = adminMap.get(key);
                }
                if (existingUser != null && existingUser.getSession().isOpen()) {
                    try {
                        existingUser.getSession().close(new CloseReason(
                                CloseReason.CloseCodes.VIOLATED_POLICY,
                                "Duplicate connection detected. Closing old connection."
                        ));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            WsUser wsUser = new WsUser(user);
            wsUser.setSession(session);

            if (user.getRole().equals(1)) {
                System.out.println("adminMap put " + key);
                // 管理员不加入用户列表，也不可加入房间
                adminMap.put(key, wsUser);
            } else {
                System.out.println("userMap put " + key);
                // 普通用户正常处理
                userMap.put(key, wsUser);
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // 创建房间
    private void createRoom(Session session, JSONObject data) {
        WsUser wsUser = getWsUserBySession(session);
        if (wsUser == null) {
            return;
        }

        Integer userId = wsUser.getUserId();
        // 检查 roomList 中是否存在该用户已经创建的房间
        boolean hasExistingRoom = roomList.stream()
                .anyMatch(room -> Objects.equals(room.getOwnerId(), userId));

        if (hasExistingRoom) {
            sendErrorMessage(session, "你已经创建过一个房间了");
            return;
        }

        Room room = new Room();
        room.setOwnerId(Integer.parseInt(data.getString("ownerId")));
        room.setMaxPlayers(data.getInteger("maxPlayers"));
        room.setCurrentPlayers(0);
        room.setCreatedAt(LocalDateTime.now());
        room.setStatus(0);
        roomList.add(room);
        broadcastRoomList();
    }

    // 加入房间
    private void joinRoom(Session session, JSONObject data) {
        WsUser wsUser = getWsUserBySession(session);
        if (wsUser == null) {
            return;
        }

        Integer ownerId = data.getInteger("ownerId");

        // 检查 roomList 中是否存在该房间
        Room targetRoom = roomList.stream()
                .filter(room -> Objects.equals(room.getOwnerId(), ownerId))
                .findFirst()
                .orElse(null);

        if (targetRoom == null) {
            sendErrorMessage(session, "该房间不存在!");
            return;
        }

        // 判断是否满员
        if (targetRoom.getPlayers().size() >= targetRoom.getMaxPlayers()) {
            sendErrorMessage(session, "该房间已满员!");
            return;
        }

        // 判断房间内是否有个自己userid一样的
        for (User player : targetRoom.getPlayers()) {
            if (player.getUserId().equals(wsUser.getUserId())) {
                sendErrorMessage(session, "你已经在这个房间了!");
                return;
            }
        }

        // 加入房间
        User user = new User(wsUser);
        user.setPassword(null);
        targetRoom.getPlayers().add(user);
        // 更新房间人数
        updateRoomPlayers(targetRoom, targetRoom.getPlayers().size());
        // 更新用户的房间id
        wsUser.setRoomId(targetRoom.getOwnerId());
        // 广播房间列表
        broadcastRoomList();
    }

    // 离开房间
    private void leaveRoom(Session session, JSONObject data) {
        WsUser wsUser = getWsUserBySession(session);
        if (wsUser == null) {
            return;
        }

        Integer ownerId = data.getInteger("ownerId");

        // 检查 roomList 中是否存在该房间
        Room targetRoom = roomList.stream()
                .filter(room -> Objects.equals(room.getOwnerId(), ownerId))
                .findFirst()
                .orElse(null);

        if (targetRoom == null) {
            sendErrorMessage(session, "该房间不存在!");
            return;
        }

        boolean found = false;

        // 使用 Iterator 安全移除玩家
        Iterator<User> iterator = targetRoom.getPlayers().iterator();
        while (iterator.hasNext()) {
            User player = iterator.next();
            if (player.getUserId().equals(wsUser.getUserId())) {
                found = true;

                // 如果是房主，解散房间
                if (player.getUserId().equals(targetRoom.getOwnerId())) {
                    dismissRoom(session, ownerId);
                    return;
                } else {
                    // 普通用户离开房间
                    iterator.remove(); // ✅ 安全地移除元素
                    wsUser.setRoomId(null);
                    break;
                }
            }
        }

        if (!found) {
            sendErrorMessage(session, "你不在该房间!");
        }

        updateRoomPlayers(targetRoom, targetRoom.getPlayers().size());
        broadcastRoomList();
    }

    // 解散房间
    private void dismissRoom(Session session, Integer ownerId) {
        WsUser wsUser = getWsUserBySession(session);
        if (wsUser == null) {
            return;
        }

        // 检查 roomList 中是否存在该房间
        Room targetRoom = roomList.stream()
                .filter(room -> Objects.equals(room.getOwnerId(), ownerId))
                .findFirst()
                .orElse(null);

        if (targetRoom == null) {
            sendErrorMessage(session, "该房间不存在!");
            return;
        }

        if (!wsUser.getUserId().equals(targetRoom.getOwnerId())) {
            sendErrorMessage(session, "你没有权限解散该房间!");
            return;
        }

        // 循环删除房间内所有用户
        for (User player : targetRoom.getPlayers()) {
            // 找userMap和adminMap里所有userId为player.getUserId()
            // 一样的，移除房间
            userMap.forEach((key, wsUserInRoom) -> {
                if (Objects.equals(wsUserInRoom.getUserId(), player.getUserId())) {
                    wsUserInRoom.setRoomId(null);
                }
            });
            adminMap.forEach((key, wsUserInRoom) -> {
                if (Objects.equals(wsUserInRoom.getUserId(), player.getUserId())) {
                    wsUserInRoom.setRoomId(null);
                }
            });
        }

        targetRoom.getPlayers().clear();
        updateRoomPlayers(targetRoom, 0);
        roomList.remove(targetRoom);

        broadcastRoomList();
    }

    public static void sendMessageToAll(String response) {
        userMap.forEach((key, wsUser) -> {
            if (wsUser.getSession().isOpen()) {
                wsUser.getSession().getAsyncRemote().sendText(response);
            }
            else {
                System.out.println("sendMessageToAll " + wsUser.getUsername() + "未成功连接");
            }
        });

        adminMap.forEach((key, wsUser) -> {
            if (wsUser.getSession().isOpen()) {
                wsUser.getSession().getAsyncRemote().sendText(response);
            }
            else {
                System.out.println("sendMessageToAll " + wsUser.getUsername() + "未成功连接");
            }
        });
    }

    // 广播房间列表
    public static void broadcastRoomList() {
        JSONObject roomListJson = new JSONObject();
        roomListJson.put("action", "room_list");
        roomListJson.put("data", roomList);
        roomListJson.put("timestamp", System.currentTimeMillis());

        String response = roomListJson.toJSONString();
        System.out.println(response);
        sendMessageToAll(response);
    }

    public static void broadcastRoomList(Session session) {
        JSONObject roomListJson = new JSONObject();
        roomListJson.put("action", "room_list");
        roomListJson.put("data", roomList);
        roomListJson.put("timestamp", System.currentTimeMillis());

        String response = roomListJson.toJSONString();
        // System.out.println(response);
        session.getAsyncRemote().sendText(response);
    }

    // 广播在线用户列表
    public static void broadcastUserList() {
        List<User> users = new ArrayList<>();

        // userMap和adminMap每个元素转成父类User类再放进users
        for (WsUser wsUser : userMap.values()) {
            User user = new User(wsUser);
            user.setPassword(null);
            users.add(user);
        }

        for (WsUser wsUser : adminMap.values()) {
            User user = new User(wsUser);
            user.setPassword(null);
            users.add(user);
        }

        JSONObject userListJson = new JSONObject();
        userListJson.put("action", "user_list");
        userListJson.put("data", users);
        userListJson.put("timestamp", System.currentTimeMillis());

        String response = userListJson.toJSONString();
        System.out.println(response);
        sendMessageToAll(response);
    }

    public static void broadcastUserList(Session session) {
        List<User> users = new ArrayList<>();

        // userMap和adminMap每个元素转成父类User类再放进users
        for (WsUser wsUser : userMap.values()) {
            User user = new User(wsUser);
            user.setPassword(null);
            users.add(user);
        }

        for (WsUser wsUser : adminMap.values()) {
            User user = new User(wsUser);
            user.setPassword(null);
            users.add(user);
        }

        JSONObject userListJson = new JSONObject();
        userListJson.put("action", "user_list");
        userListJson.put("data", users);
        userListJson.put("timestamp", System.currentTimeMillis());

        String response = userListJson.toJSONString();
        // System.out.println(response);
        session.getAsyncRemote().sendText(response);
    }


    // 更新某个房间的人数（不广播）
    public static void updateRoomPlayers(int ownerId, int newPlayerCount) {
        roomList.stream()
                .filter(room -> room.getOwnerId() == ownerId)
                .findFirst()
                .ifPresent(room -> {
                    room.setCurrentPlayers(newPlayerCount);
                });
    }

    public static void updateRoomPlayers(Room room, int newPlayerCount) {
        room.setCurrentPlayers(newPlayerCount);
    }

    // 开始游戏
    private void startGame(Session session, JSONObject data) {
        WsUser wsUser = getWsUserBySession(session);
        if (wsUser == null) {
            return;
        }

        Integer ownerId = data.getInteger("ownerId");

        // 检查 roomList 中是否存在该房间
        Room targetRoom = roomList.stream()
                .filter(room -> Objects.equals(room.getOwnerId(), ownerId))
                .findFirst()
                .orElse(null);

        if (targetRoom == null) {
            sendErrorMessage(session, "该房间不存在!");
            return;
        }

        // 判断是否在房间内
        if (wsUser.getRoomId() == null || !Objects.equals(wsUser.getRoomId(), targetRoom.getOwnerId())) {
            sendErrorMessage(session, "你不在该房间内!");
            return;
        }

        // 判断是否满员
        if (targetRoom.getPlayers().size() < targetRoom.getMaxPlayers()) {
            sendErrorMessage(session, "该房间人数不足以开始游戏!");
            return;
        }

        if (targetRoom.getStatus() != 0) {
            sendErrorMessage(session, "该房间已开始游戏!");
            return;
        }

        // 房间状的态设为游戏中
        targetRoom.setStatus(1);
        updateRoomPlayers(targetRoom, targetRoom.getPlayers().size());
        broadcastRoomList();

        JSONObject startGameJson = new JSONObject();
        startGameJson.put("action", "start_game");
        startGameJson.put("data", targetRoom);
        startGameJson.put("timestamp", System.currentTimeMillis());

        String response = startGameJson.toJSONString();

        // 循环房间内所有用户
        for (User player : targetRoom.getPlayers()) {
            // 找userMap和adminMap里所有userId为player.getUserId()
            userMap.forEach((key, wsUserInRoom) -> {
                if (Objects.equals(wsUserInRoom.getUserId(), player.getUserId())) {
                    wsUserInRoom.getSession().getAsyncRemote().sendText(response);
                }
            });
            adminMap.forEach((key, wsUserInRoom) -> {
                if (Objects.equals(wsUserInRoom.getUserId(), player.getUserId())) {
                    wsUserInRoom.getSession().getAsyncRemote().sendText(response);
                }
            });
        }
    }

    // 心跳检测
    private void startHeartbeat(Session session) {
        // 获取当前用户
        WsUser wsUser = getWsUserBySession(session);
        if (wsUser == null) return;

        scheduler.scheduleAtFixedRate(() -> {
            if (session.isOpen()) {
                try {
                    // 发送 ping 消息
                    session.getAsyncRemote().sendText("{\"type\":\"heart_beat\",\"timestamp\":" + System.currentTimeMillis() + "}");

                    // 判断是否超时未收到 pong
                    long lastPongMillis = wsUser.getLastPongTime().atZone(java.time.ZoneId.of("UTC")).toInstant().toEpochMilli();
                    long nowMillis = System.currentTimeMillis();

                    if (nowMillis - lastPongMillis > 10000) { // 10秒未回复 pong
                        System.out.println("心跳超时，关闭连接: " + wsUser.getUsername());
                        session.close(new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, "Heartbeat timeout"));
                        onClose(session);
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                    try {
                        session.close();
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                }
            } else {
                onClose(session);
            }
        }, 30, 30, TimeUnit.SECONDS);
    }

    // 根据 Session 查找 key
    private String getKeyBySession(Session session) {
        for (Map.Entry<String, WsUser> entry : userMap.entrySet()) {
            if (entry.getValue().getSession() == session) {
                return entry.getKey();
            }
        }
        for (Map.Entry<String, WsUser> entry : adminMap.entrySet()) {
            if (entry.getValue().getSession() == session) {
                return entry.getKey();
            }
        }
        return null;
    }

    private WsUser getWsUserBySession(Session session) {
        for (Map.Entry<String, WsUser> entry : userMap.entrySet()) {
            if (entry.getValue().getSession() == session) {
                return entry.getValue();
            }
        }
        for (Map.Entry<String, WsUser> entry : adminMap.entrySet()) {
            if (entry.getValue().getSession() == session) {
                return entry.getValue();
            }
        }
        return null;
    }
}

