package com.webPokerGame.websocket;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.webPokerGame.common.constant.CacheConstants;
import com.webPokerGame.common.core.domain.model.LoginUser;
import com.webPokerGame.common.core.redis.RedisCache;
import com.webPokerGame.domain.PokerRoom;
import com.webPokerGame.system.domain.SysUserOnline;
import com.webPokerGame.system.service.ISysUserOnlineService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

@Component
@ServerEndpoint("/websocket/game")
public class WebSocketEndpoint {
    private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketEndpoint.class);

    @Autowired
    private ISysUserOnlineService userOnlineService;

    @Autowired
    private RedisCache redisCache;

    // 所有在线用户
    private List<SysUserOnline> getAllOnlineUser() {
        Collection<String> keys = redisCache.keys(CacheConstants.LOGIN_TOKEN_KEY + "*");
        List<SysUserOnline> userOnlineList = new ArrayList<SysUserOnline>();
        for (String key : keys) {
            LoginUser user = redisCache.getCacheObject(key);
            userOnlineList.add(userOnlineService.loginUserToUserOnline(user));
        }
        Collections.reverse(userOnlineList);
        userOnlineList.removeAll(Collections.singleton(null));
        return userOnlineList;
    }

    // 存储房间的信息
    private static List<PokerRoom> roomList = new CopyOnWriteArrayList<>();

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        LOGGER.debug("WebSocket opened");
        // Sec-Websocket-Protocol

    }

    @OnClose
    public void onClose() {
        LOGGER.debug("WebSocket closed");
    }

    @OnError
    public void onError(Throwable error) {
        LOGGER.debug("WebSocket error: {}", error.getMessage());
    }

    @OnMessage
    public void onMessage(String message) {
        LOGGER.debug("Received message: " + message);

        // 处理加入/退出房间等指令
        JSONObject json = JSON.parseObject(message);
        String action = json.getString("action");
        JSONObject data = json.getJSONObject("data");

        switch (action) {
            case "update_data":
                // 前端初始化需要拿一次最新数据
                break;
            case "create_room":
                break;
            case "join_room":
                break;
            case "leave_room":
                break;
            case "heart_beat":
                // 心跳检测，更新用户最后心跳时间
                break;
            case "start_game_request":
                break;
            default:
                break;
        }
    }
}
