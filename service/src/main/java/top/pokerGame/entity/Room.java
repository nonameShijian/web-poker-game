package top.pokergame.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 游戏房间信息表
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
@Getter
@Setter
@ToString
@TableName("room")
public class Room implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 房间内玩家列表
     */
    @TableField(exist = false)
    private List<User> players = new ArrayList<>();

    /**
     * 房间状态：0-等待中，1-游戏中，默认0
     */
    @TableField(exist = false)
    private Integer status;

    /**
     * 房间ID
     */
    @TableId(value = "roomId", type = IdType.AUTO)
    private Integer roomId;

    /**
     * 房间创建者ID
     */
    @TableField("ownerId")
    private Integer ownerId;

    /**
     * 最大玩家数（固定4人）
     */
    @TableField("max_players")
    private Integer maxPlayers;

    /**
     * 当前玩家数
     */
    @TableField("current_players")
    private Integer currentPlayers;

    /**
     * 房间创建时间
     */
    @TableField("created_at")
    private LocalDateTime createdAt;
}
