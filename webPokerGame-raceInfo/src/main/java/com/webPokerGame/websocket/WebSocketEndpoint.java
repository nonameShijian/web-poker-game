package com.webPokerGame.websocket;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.webPokerGame.common.core.domain.entity.SysUser;
import com.webPokerGame.domain.PokerRoom;
import com.webPokerGame.framework.web.service.TokenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.*;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;

@Service
@EnableScheduling
public class WebSocketEndpoint implements WebSocketHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketEndpoint.class);

    @Autowired
    private TokenService tokenService;

    private static final String WEBSOCKET_PROTOCOL = "Sec-WebSocket-Protocol";

    // 用于存放所有连接的WebSocketSession
    private static final CopyOnWriteArraySet<WebSocketSession> webSocketSessions = new CopyOnWriteArraySet<>();

    /**
     * 存储房间的信息
     **/
    private static List<PokerRoom> roomList = new CopyOnWriteArrayList<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        LOGGER.debug("WebSocket opened");
        SysUser user;
        try {
            user = getUserInfoBySession(session);
            LOGGER.debug("token解析成功，username = {}", user.getUserName());
        }
        catch (Exception e) {
            LOGGER.debug("token解析失败, {}", e.getMessage());
            session.close();
            return;
        }

        // 成功连接后将该连接加入集合
        webSocketSessions.add(session);

        LOGGER.debug("session {} open, headers: {}.", session.getId(), session.getHandshakeHeaders());
        LOGGER.debug("当前客户端连接数：" + webSocketSessions.size());

        this.broadcast("user_list", getUserList());
        this.broadcast("room_list", roomList);
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        if (message instanceof TextMessage) {
            // 获取消息体
            String msg = ((TextMessage) message).getPayload();
            LOGGER.debug("TextMessage: " + msg);
            // 处理加入/退出房间等指令
            JSONObject json = JSON.parseObject(msg);
            String action = json.getString("action");
            JSONObject data = json.getJSONObject("data");

            switch (action) {
                case "update_data":
                    // 前端初始化需要拿一次最新数据
                    this.broadcast("user_list", getUserList());
                    this.broadcast("room_list", roomList);
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
                    break;
                case "start_game_request":
                    startGame(session, data);
                    break;
                default:
                    break;
            }

        } else if (message instanceof BinaryMessage) {
            // 对BinaryMessage不作处理
            LOGGER.debug("BinaryMessage: {}", message);
        } else if (message instanceof PongMessage) {
            // 对PongMessage不作处理
            LOGGER.debug("PongMessage: {}", message);
        } else {
            throw new IllegalStateException("Unexpected WebSocket message type: " + message);
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        LOGGER.debug("WebSocket error: {}", exception.getMessage());
        // 对于异常连接，关闭并从webSocket移除Sessions中
        if (session.isOpen()) {
            session.close();
        }
        // 移除连接
        webSocketSessions.remove(session);

        LOGGER.debug("当前客户端连接数：" + webSocketSessions.size());
        this.broadcast("user_list", getUserList());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        LOGGER.debug("WebSocket closed");
        // 移除连接
        webSocketSessions.remove(session);
        LOGGER.debug("当前客户端连接数：" + webSocketSessions.size());
        this.broadcast("user_list", getUserList());
    }

    /**
     * Whether the WebSocketHandler handles partial messages. If this flag is set to
     * {@code true} and the underlying WebSocket server supports partial messages,
     * then a large WebSocket message, or one of an unknown size may be split and
     * maybe received over multiple calls to
     * {@link #handleMessage(WebSocketSession, WebSocketMessage)}. The flag
     * {@link WebSocketMessage#isLast()} indicates if
     * the message is partial and whether it is the last part.
     */
    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    /**
     * 单播消息
     */
    private void unicast(WebSocketSession session, String action, Object data) throws Exception {
        JSONObject responseData = new JSONObject();
        responseData.put("action", action);
        responseData.put("data", data);
        responseData.put("timestamp", System.currentTimeMillis());

        session.sendMessage(new TextMessage(responseData.toJSONString()));
    }

    /**
     * 多播消息
     */
    private void broadcast(String action, Object data) throws Exception {
        JSONObject responseData = new JSONObject();
        responseData.put("action", action);
        responseData.put("data", data);
        responseData.put("timestamp", System.currentTimeMillis());

        for (WebSocketSession session : webSocketSessions) {
            session.sendMessage(new TextMessage(responseData.toJSONString()));
        }
    }

    /**
     * 定时任务，每1分钟发送一次心跳检测
     * @throws Exception Exception
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    private void sendHeartbeat() throws Exception {
        this.broadcast("heart_beat", null);
    }

    /**
     * 跟据session获取用户信息
     */
    private SysUser getUserInfoBySession(WebSocketSession session) {
        String token = session.getHandshakeHeaders().getFirst(WEBSOCKET_PROTOCOL);
        SysUser user;
        try {
            user = tokenService.getLoginUser(token).getUser();
        }
        catch (Exception e) {
            return null;
        }
        user.setPassword(null);
        return user;
    }

    /**
     * 获取在线用户列表
     */
    private List<SysUser> getUserList() {
        List<SysUser> userList = new ArrayList<>();
        for (WebSocketSession session : webSocketSessions) {
            SysUser user = getUserInfoBySession(session);
            if (user == null) {
                continue;
            }
            userList.add(user);
        }
        return userList;
    }

    /**
     * 创建房间
     */
    private void createRoom(WebSocketSession session, JSONObject data) throws Exception {
        SysUser user = getUserInfoBySession(session);
        if (user == null) return;
        Long userId = user.getUserId();

        // 检查 roomList 中是否存在该用户已经创建的房间
        boolean hasExistingRoom = roomList.stream()
                .anyMatch(room -> Objects.equals(room.getOwnerId(), userId));

        if (hasExistingRoom) {
            this.unicast(session, "msg_error", "你已经创建过一个房间了");
            return;
        }

        PokerRoom room = new PokerRoom();
        room.setOwnerId(Long.parseLong(data.getString("ownerId")));
        room.setMaxPlayers(data.getInteger("maxPlayers"));

        room.getPlayers().add(user);
        room.setCurrentPlayers(room.getPlayers().size());

        room.setCreatedAt(new Date());
        room.setStatus(0);

        roomList.add(room);
        this.broadcast("room_list", roomList);
    }

    /**
     * 加入房间
     */
    private void joinRoom(WebSocketSession session, JSONObject data) throws Exception {
        SysUser user = getUserInfoBySession(session);
        if (user == null) return;
        Long ownerId = Long.parseLong(data.getString("ownerId"));

        // 检查 roomList 中是否存在该房间
        PokerRoom targetRoom = roomList.stream()
                .filter(room -> Objects.equals(room.getOwnerId(), ownerId))
                .findFirst()
                .orElse(null);

        if (targetRoom == null) {
            this.unicast(session, "msg_error", "该房间不存在!");
            return;
        }

        // 判断是否满员
        if (targetRoom.getPlayers().size() >= targetRoom.getMaxPlayers()) {
            this.unicast(session, "msg_error", "该房间已满员!");
            return;
        }

        // 判断房间内是否有个自己userid一样的
        for (SysUser player : targetRoom.getPlayers()) {
            if (player.getUserId().equals(user.getUserId())) {
                this.unicast(session, "msg_error", "你已经在这个房间了!");
                return;
            }
        }

        // 加入房间
        targetRoom.getPlayers().add(user);
        // 广播房间列表
        this.broadcast("room_list", roomList);
    }

    /**
     * 离开房间，如果是房主则解散房间
     */
    private void leaveRoom(WebSocketSession session, JSONObject data) throws Exception {
        SysUser user = getUserInfoBySession(session);
        if (user == null) {
            return;
        }

        Long ownerId = Long.parseLong(data.getString("ownerId"));

        // 检查 roomList 中是否存在该房间
        PokerRoom targetRoom = roomList.stream()
                .filter(room -> Objects.equals(room.getOwnerId(), ownerId))
                .findFirst()
                .orElse(null);

        if (targetRoom == null) {
            this.unicast(session, "msg_error", "该房间不存在!");
            return;
        }

        boolean found = false;

        // 使用 Iterator 安全移除玩家
        Iterator<SysUser> iterator = targetRoom.getPlayers().iterator();
        while (iterator.hasNext()) {
            SysUser player = iterator.next();
            if (player.getUserId().equals(user.getUserId())) {
                found = true;

                // 如果是房主，解散房间
                if (player.getUserId().equals(targetRoom.getOwnerId())) {
                    dismissRoom(session, ownerId);
                    return;
                } else {
                    // 普通用户离开房间
                    iterator.remove();
                    // 循环webSocketSessions获取用户对应的session发送信息
//                    for (WebSocketSession webSocketSession : webSocketSessions) {
//                        SysUser userInfo = getUserInfoBySession(session);
//                        if (userInfo != null && Objects.equals(userInfo.getUserId(), player.getUserId())) {
//                            this.unicast(webSocketSession, "leave_room_id", targetRoom.getOwnerId());
//                        }
//                    }
                    break;
                }
            }
        }

        if (!found) {
            this.unicast(session, "msg_error", "你不在该房间!");
        }

        // 广播房间列表
        this.broadcast("room_list", roomList);
    }

    /**
     * 解散房间
     */
    private void dismissRoom(WebSocketSession session, Long ownerId) throws Exception {
        SysUser user = getUserInfoBySession(session);
        if (user == null) {
            return;
        }

        // 检查 roomList 中是否存在该房间
        PokerRoom targetRoom = roomList.stream()
                .filter(room -> Objects.equals(room.getOwnerId(), ownerId))
                .findFirst()
                .orElse(null);

        if (targetRoom == null) {
            this.unicast(session, "msg_error", "该房间不存在!");
            return;
        }

        if (!user.getUserId().equals(targetRoom.getOwnerId())) {
            this.unicast(session, "msg_error", "你没有权限解散该房间!");
            return;
        }

        // 循环删除房间内所有用户
//        for (SysUser player : targetRoom.getPlayers()) {
//
//        }

        targetRoom.getPlayers().clear();
        roomList.remove(targetRoom);
        // 广播房间列表
        this.broadcast("room_list", roomList);
    }

    /**
     * 开始游戏判断
     */
    private void startGame(WebSocketSession session, JSONObject data) throws Exception {
        SysUser user = getUserInfoBySession(session);
        if (user == null) {
            return;
        }

        Long ownerId = Long.parseLong(data.getString("ownerId"));

        // 检查 roomList 中是否存在该房间
        PokerRoom targetRoom = roomList.stream()
                .filter(room -> Objects.equals(room.getOwnerId(), ownerId))
                .findFirst()
                .orElse(null);

        if (targetRoom == null) {
            this.unicast(session, "msg_error", "该房间不存在!");
            return;
        }

        // 判断是否满员
        if (targetRoom.getPlayers().size() < targetRoom.getMaxPlayers()) {
            this.unicast(session, "msg_error", "该房间人数不足以开始游戏!");
            return;
        }

        // 判断房间的状态
        if (targetRoom.getStatus() != 0) {
            this.unicast(session, "msg_error", "该房间已开始游戏!");
            return;
        }

        // 房间的状态设为游戏中
        targetRoom.setStatus(1);
        // 广播房间列表
        this.broadcast("room_list", roomList);
        // 循环房间内所有用户
        for (SysUser player : targetRoom.getPlayers()) {
            // 通过循环webSocketSessions判断和player的id是否对应
            for (WebSocketSession userSession : webSocketSessions) {
                SysUser userInfo = getUserInfoBySession(userSession);
                if (userInfo != null && Objects.equals(userInfo.getUserId(), player.getUserId())) {
                    // 单播开始游戏信号
                    this.unicast(userSession, "start_game", targetRoom);
                }
            }
        }
    }
}
