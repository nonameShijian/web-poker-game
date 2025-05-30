package com.webPokerGame.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.webPokerGame.common.annotation.Excel;
import com.webPokerGame.common.core.domain.BaseEntity;

/**
 * 游戏房间信息对象 poker_room
 * 
 * @author lwy
 * @date 2025-05-25
 */
public class PokerRoom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 房间ID */
    private Long roomId;

    /** 房间创建者ID */
    @Excel(name = "房间创建者ID")
    private Long ownerId;

    /** 最大玩家数（固定4人） */
    @Excel(name = "最大玩家数", readConverterExp = "固=定4人")
    private Integer maxPlayers;

    /** 当前玩家数 */
    @Excel(name = "当前玩家数")
    private Integer currentPlayers;

    /** 房间创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "房间创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setRoomId(Long roomId) 
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }
    public void setOwnerId(Long ownerId) 
    {
        this.ownerId = ownerId;
    }

    public Long getOwnerId() 
    {
        return ownerId;
    }
    public void setMaxPlayers(Integer maxPlayers) 
    {
        this.maxPlayers = maxPlayers;
    }

    public Integer getMaxPlayers() 
    {
        return maxPlayers;
    }
    public void setCurrentPlayers(Integer currentPlayers) 
    {
        this.currentPlayers = currentPlayers;
    }

    public Integer getCurrentPlayers() 
    {
        return currentPlayers;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("roomId", getRoomId())
            .append("ownerId", getOwnerId())
            .append("maxPlayers", getMaxPlayers())
            .append("currentPlayers", getCurrentPlayers())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
