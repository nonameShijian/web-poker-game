package com.webPokerGame.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.webPokerGame.common.annotation.Excel;
import com.webPokerGame.common.core.domain.BaseEntity;

/**
 * 游戏房间聊天记录对象 poker_chat_message
 * 
 * @author lwy
 * @date 2025-05-25
 */
public class PokerChatMessage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 消息ID */
    private Long messageId;

    /** 所属房间ID */
    @Excel(name = "所属房间ID")
    private Long roomId;

    /** 发送者ID */
    @Excel(name = "发送者ID")
    private Long userId;

    /** 消息内容 */
    @Excel(name = "消息内容")
    private String message;

    /** 发送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发送时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date sentTime;

    public void setMessageId(Long messageId) 
    {
        this.messageId = messageId;
    }

    public Long getMessageId() 
    {
        return messageId;
    }
    public void setRoomId(Long roomId) 
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setMessage(String message) 
    {
        this.message = message;
    }

    public String getMessage() 
    {
        return message;
    }
    public void setSentTime(Date sentTime) 
    {
        this.sentTime = sentTime;
    }

    public Date getSentTime() 
    {
        return sentTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("messageId", getMessageId())
            .append("roomId", getRoomId())
            .append("userId", getUserId())
            .append("message", getMessage())
            .append("sentTime", getSentTime())
            .toString();
    }
}
