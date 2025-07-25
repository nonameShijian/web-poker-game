package com.webPokerGame.service;

import java.util.List;
import com.webPokerGame.domain.PokerChatMessage;

/**
 * 游戏房间聊天记录Service接口
 * 
 * @author lwy
 * @date 2025-05-25
 */
public interface IPokerChatMessageService 
{
    /**
     * 查询游戏房间聊天记录
     * 
     * @param messageId 游戏房间聊天记录主键
     * @return 游戏房间聊天记录
     */
    public PokerChatMessage selectPokerChatMessageByMessageId(Long messageId);

    /**
     * 查询游戏房间聊天记录列表
     * 
     * @param pokerChatMessage 游戏房间聊天记录
     * @return 游戏房间聊天记录集合
     */
    public List<PokerChatMessage> selectPokerChatMessageList(PokerChatMessage pokerChatMessage);

    /**
     * 新增游戏房间聊天记录
     * 
     * @param pokerChatMessage 游戏房间聊天记录
     * @return 结果
     */
    public int insertPokerChatMessage(PokerChatMessage pokerChatMessage);

    /**
     * 修改游戏房间聊天记录
     * 
     * @param pokerChatMessage 游戏房间聊天记录
     * @return 结果
     */
    public int updatePokerChatMessage(PokerChatMessage pokerChatMessage);

    /**
     * 批量删除游戏房间聊天记录
     * 
     * @param messageIds 需要删除的游戏房间聊天记录主键集合
     * @return 结果
     */
    public int deletePokerChatMessageByMessageIds(Long[] messageIds);

    /**
     * 删除游戏房间聊天记录信息
     * 
     * @param messageId 游戏房间聊天记录主键
     * @return 结果
     */
    public int deletePokerChatMessageByMessageId(Long messageId);
}
