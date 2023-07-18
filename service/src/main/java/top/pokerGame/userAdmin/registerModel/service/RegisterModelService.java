package top.pokerGame.userAdmin.registerModel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.pokerGame.pojo.User;

import java.util.List;
import java.util.Map;

// 注册模块Service
@Service
public class RegisterModelService {

    // 获得 registerModelService
    @Autowired
    RegisterModelService registerModelService;

    // 新增用户
    public Integer addUser(Map map) {
        return registerModelService.addUser(map);
    }

    // 修改用户
    public Integer updateUser(Map map) {
        return registerModelService.updateUser(map);
    }

    // 删除用户
    public Integer deleteUser(Map map) {
        return registerModelService.deleteUser(map);
    }

    // 按照 id 查询指定用户
    public User selectUserById(Integer userId) {
        return registerModelService.selectUserById(userId);
    }

    // 使用 昵称 或 用户名 查询用户（模糊查询）
    public List<User> selectUserByInfo(Map map) {
        return registerModelService.selectUserByInfo(map);
    }

}
