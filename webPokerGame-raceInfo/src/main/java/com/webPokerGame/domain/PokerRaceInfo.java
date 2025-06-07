package com.webPokerGame.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.webPokerGame.common.annotation.Excel;
import com.webPokerGame.common.core.domain.BaseEntity;

/**
 * 历史比赛信息对象 poker_race_info
 * 
 * @author lwy
 * @date 2025-05-25
 */
public class PokerRaceInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 比赛信息id */
    @Excel(name = "比赛信息id")
    private Long id;

    /** 比赛id */
    @Excel(name = "比赛id")
    private String raceId;

    /** 玩家A */
    @Excel(name = "玩家A")
    private Integer playerA;

    /** 玩家B */
    @Excel(name = "玩家B")
    private Integer playerB;

    /** 玩家C */
    @Excel(name = "玩家C")
    private Integer playerC;

    /** 玩家D */
    @Excel(name = "玩家D")
    private Integer playerD;

    /** 胜者A */
    @Excel(name = "胜者A")
    private Integer winnerA;

    /** 胜者B */
    @Excel(name = "胜者B")
    private Integer winnerB;

    /** 比赛时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "比赛时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date raceTime;

    /** 赢家积分情况 */
    @Excel(name = "赢家积分情况")
    private Long winnerScore;

    /** 输家积分情况 */
    @Excel(name = "输家积分情况")
    private Long loserScore;

    /** 记录状态：0-已删除，1-正常 */
    @Excel(name = "记录状态：0-已删除，1-正常")
    private Integer status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setRaceId(String raceId)
    {
        this.raceId = raceId;
    }

    public String getRaceId()
    {
        return raceId;
    }
    public void setPlayerA(Integer playerA) 
    {
        this.playerA = playerA;
    }

    public Integer getPlayerA() 
    {
        return playerA;
    }
    public void setPlayerB(Integer playerB) 
    {
        this.playerB = playerB;
    }

    public Integer getPlayerB() 
    {
        return playerB;
    }
    public void setPlayerC(Integer playerC) 
    {
        this.playerC = playerC;
    }

    public Integer getPlayerC() 
    {
        return playerC;
    }
    public void setPlayerD(Integer playerD) 
    {
        this.playerD = playerD;
    }

    public Integer getPlayerD() 
    {
        return playerD;
    }
    public void setWinnerA(Integer winnerA) 
    {
        this.winnerA = winnerA;
    }

    public Integer getWinnerA() 
    {
        return winnerA;
    }
    public void setWinnerB(Integer winnerB) 
    {
        this.winnerB = winnerB;
    }

    public Integer getWinnerB() 
    {
        return winnerB;
    }
    public void setRaceTime(Date raceTime) 
    {
        this.raceTime = raceTime;
    }

    public Date getRaceTime() 
    {
        return raceTime;
    }
    public void setWinnerScore(Long winnerScore) 
    {
        this.winnerScore = winnerScore;
    }

    public Long getWinnerScore() 
    {
        return winnerScore;
    }
    public void setLoserScore(Long loserScore) 
    {
        this.loserScore = loserScore;
    }

    public Long getLoserScore() 
    {
        return loserScore;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("raceId", getRaceId())
            .append("playerA", getPlayerA())
            .append("playerB", getPlayerB())
            .append("playerC", getPlayerC())
            .append("playerD", getPlayerD())
            .append("winnerA", getWinnerA())
            .append("winnerB", getWinnerB())
            .append("raceTime", getRaceTime())
            .append("winnerScore", getWinnerScore())
            .append("loserScore", getLoserScore())
            .append("status", getStatus())
            .toString();
    }
}
