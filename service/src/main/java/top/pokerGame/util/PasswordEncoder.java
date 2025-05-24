package top.pokergame.util;

import org.mindrot.jbcrypt.BCrypt;import org.springframework.stereotype.Component;

@Component
public class PasswordEncoder {
    // 默认 salt rounds 数量，值越大越安全，默认是10
    private static final int SALT_ROUNDS = 10;

    // 加密方法
    public String encode(String rawPassword) {
        return BCrypt.hashpw(rawPassword, BCrypt.gensalt(SALT_ROUNDS));
    }

    // 校验密码是否匹配
    public boolean matches(String rawPassword, String encodedPassword) {
        return BCrypt.checkpw(rawPassword, encodedPassword);
    }

    public static void main(String[] args) {
        PasswordEncoder encoder = new PasswordEncoder();
        String rawPassword = "645d86b8a240e335cc82fdc7b627d847b0dde5a90a7b874a405b0736ba3444c4";

        String encoded = encoder.encode(rawPassword);
        System.out.println("Encoded: " + encoded);

        boolean isMatch = encoder.matches(rawPassword, encoded);
        System.out.println("Matches: " + isMatch);
    }
}
