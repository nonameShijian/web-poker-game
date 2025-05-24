package top.pokergame.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import top.pokergame.entity.Result;
import top.pokergame.entity.User;
import top.pokergame.mapper.UserMapper;
import top.pokergame.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.pokergame.util.Jwt;
import top.pokergame.util.PasswordEncoder;
import top.pokergame.util.RegexConstants;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 用户基础信息表 服务实现类
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
    private final PasswordEncoder passwordEncoder;

    @Resource
    private Jwt jwt;

    @Autowired
    public UserServiceImpl(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public Result<Map<String, String>> login(String email, String shaPassword) {
        if (!email.matches(RegexConstants.EMAIL_REGEX)) {
            return Result.error(RegexConstants.EMAIL_TIP);
        }
        User user = this.getOne(new QueryWrapper<User>().eq("email", email));
        if (user == null) {
            return Result.error("用户不存在");
        }

        if (user.getStatus() == 0) {
            return Result.error("用户被禁用，请联系管理员");
        }

        // 判断是否被锁定
        if (user.isLocked()) {
            LocalDateTime lockTime = user.getLastLoginFailTime();
            // 超过10分钟解锁
            if (lockTime != null && Duration.between(lockTime, LocalDateTime.now()).toMinutes() > 10) {
                user.setLocked(false);
                user.setLoginFailCount(0);
            } else {
                return Result.error("账户已被锁定，请稍后再试或联系管理员");
            }
        }

        if (passwordEncoder.matches(shaPassword, user.getPassword())) {
            // 登录成功，重置失败次数
            user.setLoginFailCount(0);

            // 创建短期和长期的 JWT Token
            Map<String, Object> data = new HashMap<>();
            data.put("userId", user.getUserId());
            data.put("username", user.getUsername());
            data.put("role", user.getRole());

            String accessToken = jwt.createToken(data, System.currentTimeMillis() + 3600000); // 1 hour
            String refreshToken = jwt.createToken(data, System.currentTimeMillis() + 604800000); // 7 days


            Map<String, String> tokenMap = new HashMap<>();
            tokenMap.put("accessToken", accessToken);
            tokenMap.put("refreshToken", refreshToken);
            tokenMap.put("role", String.valueOf(user.getRole()));

            return Result.success(tokenMap);
        }
        else {
            // 登录失败，更新失败次数
            int failCount = user.getLoginFailCount() + 1;
            if (failCount >= 5) {
                // 达到最大尝试次数，锁定账户
                user.setLocked(true);
                user.setLoginFailCount(failCount);
                user.setLastLoginFailTime(LocalDateTime.now());
                return Result.error("密码错误次数过多，账户已锁定");
            } else {
                user.setLoginFailCount(failCount);
                user.setLastLoginFailTime(LocalDateTime.now());
                return Result.error("密码错误");
            }
        }
    }

    public Result<Boolean> register(String email, String username, String shaPassword) {
        if (this.getOne(new QueryWrapper<User>().eq("email", email)) != null) {
            return Result.error("该邮箱已注册过本平台");
        }

        if (this.getOne(new QueryWrapper<User>().eq("username", username)) != null) {
            return Result.error("用户名已存在");
        }

        if (!email.matches(RegexConstants.EMAIL_REGEX)) {
            return Result.error(RegexConstants.EMAIL_TIP);
        }

        if (!username.matches(RegexConstants.USERNAME_REGEX)) {
            return Result.error(RegexConstants.USERNAME_TIP);
        }

        // 加密后的密码不进行强度判断
//        if (!shaPassword.matches(RegexConstants.PASSWORD_REGEX)) {
//            return Result.error(RegexConstants.PASSWORD_TIP);
//        }

        User newUser = new User();
        newUser.setEmail(email);
        newUser.setUsername(username);
        // 存入 BCrypt 加密后的结果
        newUser.setPassword(passwordEncoder.encode(shaPassword));

        boolean result = this.save(newUser);
        return result ? Result.success(null) : Result.error("注册失败");
    }

    public Result<Boolean> unlockAccount(String username) {
        User user = this.getOne(new QueryWrapper<User>().eq("username", username));
        if (user == null) {
            return Result.error("用户不存在");
        }

        user.setLocked(false);
        user.setLoginFailCount(0);
        this.updateById(user);

        return Result.success(true);
    }

    public Result<Map<String, String>> refreshToken(String refreshToken) {
        try {
            Map<String, Object> claims = jwt.validateToken(refreshToken);
            String newAccessToken = jwt.createToken(claims, System.currentTimeMillis() + 3600000); // 1 hour
            return Result.success(Map.of("accessToken", newAccessToken));
        } catch (Exception e) {
            return Result.error("refresh token 失效");
        }
    }

    public Result<User> getUserInfoByToken(String token) {
        try {
            Map<String, Object> claims = jwt.validateToken(token);
            if (claims == null) {
                return Result.error("token验证失败");
            }
            String username = (String) claims.get("username");
            User user = this.getOne(new QueryWrapper<User>().eq("username", username));
            if (user == null) {
                return Result.error("用户不存在");
            }
            user.setPassword(null);
            return Result.success(user);
        } catch (Exception e) {
            return Result.error("refresh token失效");
        }
    }

    public Result<Boolean> updateUser(User user) {
        // 跟据传入的user更新，但是不更新密码
        User oldUser = this.getOne(new QueryWrapper<User>().eq("userId", user.getUserId()));
        if (oldUser == null) {
            return Result.error("用户不存在");
        }
        oldUser.setEmail(user.getEmail());
        oldUser.setRole(user.getRole());
        oldUser.setUsername(user.getUsername());
        oldUser.setSex(user.getSex());
        oldUser.setStatus(user.getStatus());
        oldUser.setPhoto(user.getPhoto());
        return this.updateById(oldUser) ? Result.success(true) : Result.error("更新失败");
    }
}
