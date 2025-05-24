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
 * 游戏房间聊天记录表
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
@Getter
@Setter
@ToString
@TableName("chat_message")
public class ChatMessage implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 消息ID
     */
    @TableId(value = "messageId", type = IdType.AUTO)
    private Integer messageId;

    /**
     * 所属房间ID
     */
    @TableField("roomId")
    private Integer roomId;

    /**
     * 发送者ID
     */
    @TableField("userId")
    private Integer userId;

    /**
     * 消息内容
     */
    @TableField("message")
    private String message;

    /**
     * 发送时间
     */
    @TableField("sent_time")
    private LocalDateTime sentTime;
}
