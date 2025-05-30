package com.webPokerGame.web.controller.system;

import java.util.List;
import java.util.Set;

import com.webPokerGame.common.annotation.Anonymous;
import com.webPokerGame.common.utils.RsaUtils;
import com.webPokerGame.framework.web.handler.IgnoreAjaxResult;
import jdk.nashorn.internal.ir.annotations.Ignore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.webPokerGame.common.constant.Constants;
import com.webPokerGame.common.core.domain.AjaxResult;
import com.webPokerGame.common.core.domain.entity.SysMenu;
import com.webPokerGame.common.core.domain.entity.SysUser;
import com.webPokerGame.common.core.domain.model.LoginBody;
import com.webPokerGame.common.utils.SecurityUtils;
import com.webPokerGame.framework.web.service.SysLoginService;
import com.webPokerGame.framework.web.service.SysPermissionService;
import com.webPokerGame.system.service.ISysMenuService;

/**
 * 登录验证
 * 
 * @author ruoyi
 */
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    /**
     * 登录方法
     * 
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 登录获取token
     * @param LoginBody
     * @return
     */
    @Anonymous
    @PostMapping("/getToken")
    public AjaxResult getPlatformToken(@RequestBody LoginBody LoginBody){
        AjaxResult ajax = AjaxResult.success();
        String token = loginService.login(LoginBody.getUsername(), LoginBody.getPassword());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     * 
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
        return AjaxResult.success(menuService.buildMenus(menus));
    }
}
