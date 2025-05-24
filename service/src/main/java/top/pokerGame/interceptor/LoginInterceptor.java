package top.pokergame.interceptor;

import top.pokergame.entity.Result;
import top.pokergame.util.Jwt;
import com.alibaba.fastjson.JSON;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Map;

@Component
public class LoginInterceptor implements HandlerInterceptor {
    private final Jwt jwtUtils;

    @Autowired
    public LoginInterceptor(Jwt jwtUtils) {
        this.jwtUtils = jwtUtils;
    }

    @Override
    // 进入Controller之前进行的拦截
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("拦截器preHandle拦截");
        System.out.println(request.getRequestURI());

        String uri = request.getRequestURI();
        if (uri.endsWith("/user/login") ||
                uri.endsWith("/user/register") ||
                uri.equals("/pokerGame/ws") ||
                uri.contains(";jsessionid=")) {
            System.out.println("放行");
            return true;
        }

        String token = request.getHeader("Authorization");
        if (token == null) {
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(JSON.toJSONString(Result.error("未登录")));
            System.out.println("拦截");
            return false;
        } else {
            try {
                Map<String, Object> map = jwtUtils.validateToken(token);
                System.out.println(map);

                String requestURI = request.getRequestURI();
                if (requestURI.startsWith("/admin/")) {
                    // 强制要求管理员权限
                    String role = (String) map.get("role");
                    if (!role.equals("1")) {
                        response.getWriter().write(JSON.toJSONString(Result.error("无管理员权限")));
                        return false;
                    }
                }
                System.out.println("放行");
                // 放行
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(JSON.toJSONString(Result.error("token无效或已过期")));
                return false;
            }
        }
    }
}
