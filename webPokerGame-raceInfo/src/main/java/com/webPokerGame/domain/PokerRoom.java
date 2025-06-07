package com.webPokerGame.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.webPokerGame.common.core.domain.entity.SysUser;
import lombok.Getter;
import lombok.Setter;
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
@Setter
@Getter
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

    private List<SysUser> players = new ArrayList<>();

    /**
     * 房间状态，0-等待中，1-游戏中，默认0
     */
    private int status = 0;

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
