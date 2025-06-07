package com.webPokerGame.config;

import com.webPokerGame.interceptor.WebsocketHandshakeInterceptor;
import com.webPokerGame.websocket.WebSocketEndpoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    private String origin = "*";

    @Autowired
    private WebSocketEndpoint webSocketEndpoint;

    @Autowired
    private WebsocketHandshakeInterceptor websocketHandshakeInterceptor;

    /**
     * 注册WebSocket处理器
     * 配置处理器、拦截器、允许域、SockJs支持
     *
     * @param registry registry
     */
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {

        // 设置允许域，当请求的RequestHeaders中的Origin不在允许范围内，禁止连接
        String[] allowedOrigins = {origin};

        registry.addHandler(webSocketEndpoint, "/websocket/game")
                .addInterceptors(websocketHandshakeInterceptor)
                .setAllowedOrigins(allowedOrigins);
    }
}