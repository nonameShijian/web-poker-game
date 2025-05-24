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

/**
 * <p>
 * 历史比赛结果记录表
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
@Getter
@Setter
@ToString
@TableName("race_info")
public class RaceInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 比赛ID
     */
    @TableId(value = "raceId", type = IdType.AUTO)
    private Integer raceId;

    /**
     * 比赛时间
     */
    @TableField("timestamp")
    private LocalDateTime timestamp;

    /**
     * 赢家1
     */
    @TableField("winner1")
    private Integer winner1;

    /**
     * 赢家2
     */
    @TableField("winner2")
    private Integer winner2;

    /**
     * 输家1
     */
    @TableField("loser1")
    private Integer loser1;

    /**
     * 输家2
     */
    @TableField("loser2")
    private Integer loser2;

    /**
     * 赢家积分情况
     */
    @TableField("winner_score")
    private Integer winnerScore;

    /**
     * 输家积分情况
     */
    @TableField("loser_score")
    private Integer loserScore;

    /**
     * 记录状态：0-已删除，1-正常
     */
    @TableField("status")
    private Boolean status;
}
