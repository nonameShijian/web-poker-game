package top.pokergame.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 用户基础信息表
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
@Getter
@Setter
@ToString
@TableName("user")
@NoArgsConstructor
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    // 子类转父类的构造函数
    public User(User user) {
        this.userId = user.getUserId();
        this.username = user.getUsername();
        this.sex = user.getSex();
        this.password = user.getPassword();
        this.photo = user.getPhoto();
        this.status = user.getStatus();
        this.role = user.getRole();
        this.email = user.getEmail();
        this.locked = user.isLocked();
        this.loginFailCount = user.getLoginFailCount();
        this.lastLoginFailTime = user.getLastLoginFailTime();
    }

    /**
     * 账户是否被锁定
     */
    @TableField(exist = false)
    private boolean locked = false;

    /**
     * 登录失败次数
     */
    @TableField(exist = false)
    private Integer loginFailCount = 0;

    /**
     * 最后一次失败登录时间
     */
    @TableField(exist = false)
    private LocalDateTime lastLoginFailTime = null;

    /**
     * 用户ID，自增主键
     */
    @TableId(value = "userId", type = IdType.AUTO)
    private Integer userId;

    /**
     * 登录用户名
     */
    @TableField("username")
    private String username;

    /**
     * 性别：0-男，1-女，默认0
     */
    @TableField("sex")
    private Integer sex;

    /**
     * 加密后的密码
     */
    @TableField("password")
    private String password;

    /**
     * 用户头像图片数据
     */
    @TableField("photo")
    private Blob photo;

    /**
     * 账户状态：0-禁用，1-正常，默认1
     */
    @TableField("status")
    private Integer status;

    /**
     * 角色：0-普通用户，1-管理员
     */
    @TableField("role")
    private Integer role;

    /**
     * 用户邮箱地址
     */
    @TableField("email")
    private String email;
}
