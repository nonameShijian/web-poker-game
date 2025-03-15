package com.webPokerGame.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.webPokerGame.common.annotation.Excel;
import com.webPokerGame.common.core.domain.BaseEntity;

/**
 * 用护胜负情况对象 pocker_user_game_info
 * 
 * @author lwy
 * @date 2025-03-15
 */
public class PokerUserGameInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 信息id */
    @Excel(name = "信息id")
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Integer userId;

    /** 胜场次数 */
    @Excel(name = "胜场次数")
    private Integer win;

    /** 败场次数 */
    @Excel(name = "败场次数")
    private Integer lost;

    /** 比赛场次 */
    @Excel(name = "比赛场次")
    private Integer raceNum;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Integer userId) 
    {
        this.userId = userId;
    }

    public Integer getUserId() 
    {
        return userId;
    }
    public void setWin(Integer win) 
    {
        this.win = win;
    }

    public Integer getWin() 
    {
        return win;
    }
    public void setLost(Integer lost) 
    {
        this.lost = lost;
    }

    public Integer getLost() 
    {
        return lost;
    }
    public void setRaceNum(Integer raceNum) 
    {
        this.raceNum = raceNum;
    }

    public Integer getRaceNum() 
    {
        return raceNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("win", getWin())
            .append("lost", getLost())
            .append("raceNum", getRaceNum())
            .toString();
    }
}
