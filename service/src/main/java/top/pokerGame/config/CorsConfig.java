
package top.pokergame.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**") // 指定需要跨域的路径
                .allowedOrigins("http://localhost:5173") // 允许的来源
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS") // 允许的方法
                .allowedHeaders("*") // 允许的头部信息
                .allowCredentials(true); // 是否允许发送Cookie
    }
}