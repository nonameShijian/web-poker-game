package top.pokergame.aspect;

import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import top.pokergame.util.Jwt;

import java.util.Map;

/**
 * 使用Spring AOP拦截所有带有@RequireAdmin注解的方法，
 * 并检查JWT解析后的角色是否为role=1
 */
@Aspect
@Component
public class AdminAuthorizationAspect {

    private final Jwt jwtUtils;

    @Autowired
    public AdminAuthorizationAspect(Jwt jwtUtils) {
        this.jwtUtils = jwtUtils;
    }

    @Before("@annotation(top.pokergame.nterface.RequireAdmin)")
    public void checkAdminRole(JoinPoint joinPoint) throws Exception {
        // 获取请求中的token
        ServletRequestAttributes attributes =
                (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        if (request.getRequestURI().contains(";jsessionid=")) {
            return;
        }

        String token = request.getHeader("Authorization");
        if (token == null) {
            throw new RuntimeException("未登录");
        }

        Map<String, Object> claims = jwtUtils.validateToken(token);
        Integer role = (Integer) claims.get("role");

        if (role == null || role != 1) {
            throw new RuntimeException("无权限访问");
        }
    }
}
