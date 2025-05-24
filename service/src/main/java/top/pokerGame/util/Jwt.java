package top.pokergame.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Map;

@Component
public class Jwt {
    private static final String JWT_key = "lntu";

    public String createToken(Map<String, Object> map){
        return JWT.create()
                .withClaim("pokerGame", map)
                .withExpiresAt(new Date(System.currentTimeMillis()+60*3*1000))
                .sign(Algorithm.HMAC256(JWT_key));
    }

    public String createToken(Map<String, Object> map, long time){
        return JWT.create()
                .withClaim("pokerGame", map)
                .withExpiresAt(new Date(time))
                .sign(Algorithm.HMAC256(JWT_key));
    }

    public Map<String, Object> validateToken(String token){
        return JWT.require(Algorithm.HMAC256(JWT_key))
                .build().verify(token)
                .getClaim("pokerGame")
                .asMap();
    }
}
