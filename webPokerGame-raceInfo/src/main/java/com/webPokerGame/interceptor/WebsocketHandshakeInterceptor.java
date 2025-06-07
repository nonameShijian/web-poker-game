package com.webPokerGame.interceptor;

import com.webPokerGame.common.core.domain.model.LoginUser;
import com.webPokerGame.framework.web.service.TokenService;
import lombok.NonNull;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**  * Websocket握手拦截器  */
@Component
public class WebsocketHandshakeInterceptor implements HandshakeInterceptor {
    private static final Logger LOGGER = LoggerFactory.getLogger(WebsocketHandshakeInterceptor.class);

    private static final String WEBSOCKET_PROTOCOL = "Sec-WebSocket-Protocol";

    @Autowired
    private TokenService tokenService;

    /**
     * 初次握手访问前 校验token
     **/
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler handler, Map<String, Object> map) {
        if (request instanceof ServletServerHttpRequest) {
            HttpServletRequest req = ((ServletServerHttpRequest) request).getServletRequest();
            String token = req.getHeader(WEBSOCKET_PROTOCOL);
            LOGGER.debug("token = {}", token);
            // 验证token
            if (StringUtils.isEmpty(token)) {
                LOGGER.debug("token为空");
                return false;
            }
            try {
                LoginUser user = tokenService.getLoginUser(token);
                // tokenService.verifyToken(user);
                LOGGER.debug("token解析成功，username = {}, ip = {}", user.getUsername(), user.getIpaddr());
            }
            catch (Exception e) {
                return false;
            }
        }
        return true;
    }
    /**
     * 初次握手访问后，将前端自定义协议头Sec-WebSocket-Protocol原封不动返回回去，否则会报错
     **/
    @Override
    public void afterHandshake(@NonNull ServerHttpRequest request, @NonNull ServerHttpResponse response, @NonNull WebSocketHandler handler, Exception exception) {
        HttpServletRequest httpRequest = ((ServletServerHttpRequest) request).getServletRequest();
        HttpServletResponse httpResponse = ((ServletServerHttpResponse) response).getServletResponse();
        if (StringUtils.isNotEmpty(httpRequest.getHeader("Sec-WebSocket-Protocol"))) {
            httpResponse.addHeader(WEBSOCKET_PROTOCOL, httpRequest.getHeader(WEBSOCKET_PROTOCOL));
        }
    }
}
