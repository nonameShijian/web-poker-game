package top.pokergame.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * <p>
 * 用户游戏胜负统计表
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
@Getter
@Setter
@ToString
@TableName("user_game_stats")
public class UserGameStats implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @TableId(value = "userId", type = IdType.AUTO)
    private Integer userId;

    /**
     * 累计胜利场次
     */
    @TableField("total_win")
    private Integer totalWin;

    /**
     * 累计失败场次
     */
    @TableField("total_lost")
    private Integer totalLost;

    /**
     * 总参与场次
     */
    @TableField("total_games")
    private Integer totalGames;
}
