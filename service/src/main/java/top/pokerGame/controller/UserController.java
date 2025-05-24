package top.pokergame.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.pokergame.entity.Result;
import top.pokergame.entity.User;
import top.pokergame.nterface.RequireAdmin;
import top.pokergame.service.IUserService;
import top.pokergame.util.Jwt;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController extends BaseController<User, IUserService> {

    @Resource
    private Jwt jwt;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @PostMapping("/login")
    public Result<Map<String, String>> login(@RequestBody User user) {
        return service.login(user.getEmail(), user.getPassword());
    }

    @PostMapping("/register")
    public Result<Boolean> register(@RequestBody User user) {
        return service.register(user.getEmail(), user.getUsername(), user.getPassword());
    }

    @PostMapping("/unlockAccount")
    @RequireAdmin
    public Result<Boolean> unlockAccount(String username) {
        return service.unlockAccount(username);
    }

    @PostMapping("/refreshToken")
    public Result<Map<String, String>> refreshToken(@RequestParam String refreshToken) {
        return service.refreshToken(refreshToken);
    }

    @GetMapping("/getAll")
    @RequireAdmin
    public Result<List<User>> getAll() {
        return Result.success(super.selectAll());
    }

    @GetMapping("/getUserInfoByToken")
    public Result<User> getUserInfoByToken(@RequestParam String token) {
        return service.getUserInfoByToken(token);
    }

    @PostMapping("/update")
    public Result<Boolean> updateUser(@RequestBody User user) {
        return service.updateUser(user);
    }

    @GetMapping("/delete")
    @RequireAdmin
    public Result<Boolean> deleteUser(@RequestParam int id) {
        return Result.success(super.deleteById(id));
    }

    @GetMapping("/getNameById")
    public Result<String> getNameById(@RequestParam int id) {
        User user = super.selectById(id);
        return Result.success(user.getUsername());
    }
}
