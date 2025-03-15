package com.webPokerGame.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.webPokerGame.common.annotation.Excel;
import com.webPokerGame.common.core.domain.BaseEntity;

/**
 * 历史比赛信息对象 pocker_race_info
 * 
 * @author lwy
 * @date 2025-03-15
 */
public class PokerRaceInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 信息id */
    @Excel(name = "信息id")
    private Long id;

    /** 比赛id */
    @Excel(name = "比赛id")
    private Integer raceId;

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

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setRaceId(Integer raceId) 
    {
        this.raceId = raceId;
    }

    public Integer getRaceId() 
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
            .toString();
    }
}
