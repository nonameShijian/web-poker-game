package top.pokergame.service;

import top.pokergame.entity.Result;
import top.pokergame.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 用户基础信息表 服务类
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
public interface IUserService extends IService<User> {
    Result<Map<String, String>> login(String email, String md5Password);

    Result<Boolean> register(String email, String username, String md5Password);

    /**
     * 管理员解锁账户
     */
    Result<Boolean> unlockAccount(String username);

    Result<Map<String, String>> refreshToken(String refreshToken);

    Result<User> getUserInfoByToken(String token);

    Result<Boolean> updateUser(User user);
}
