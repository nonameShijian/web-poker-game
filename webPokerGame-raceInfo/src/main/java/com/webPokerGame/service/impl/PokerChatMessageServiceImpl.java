package com.webPokerGame.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.webPokerGame.mapper.PokerChatMessageMapper;
import com.webPokerGame.domain.PokerChatMessage;
import com.webPokerGame.service.IPokerChatMessageService;

/**
 * 游戏房间聊天记录Service业务层处理
 * 
 * @author lwy
 * @date 2025-05-25
 */
@Service
public class PokerChatMessageServiceImpl implements IPokerChatMessageService 
{
    @Autowired
    private PokerChatMessageMapper pokerChatMessageMapper;

    /**
     * 查询游戏房间聊天记录
     * 
     * @param messageId 游戏房间聊天记录主键
     * @return 游戏房间聊天记录
     */
    @Override
    public PokerChatMessage selectPokerChatMessageByMessageId(Long messageId)
    {
        return pokerChatMessageMapper.selectPokerChatMessageByMessageId(messageId);
    }

    /**
     * 查询游戏房间聊天记录列表
     * 
     * @param pokerChatMessage 游戏房间聊天记录
     * @return 游戏房间聊天记录
     */
    @Override
    public List<PokerChatMessage> selectPokerChatMessageList(PokerChatMessage pokerChatMessage)
    {
        return pokerChatMessageMapper.selectPokerChatMessageList(pokerChatMessage);
    }

    /**
     * 新增游戏房间聊天记录
     * 
     * @param pokerChatMessage 游戏房间聊天记录
     * @return 结果
     */
    @Override
    public int insertPokerChatMessage(PokerChatMessage pokerChatMessage)
    {
        return pokerChatMessageMapper.insertPokerChatMessage(pokerChatMessage);
    }

    /**
     * 修改游戏房间聊天记录
     * 
     * @param pokerChatMessage 游戏房间聊天记录
     * @return 结果
     */
    @Override
    public int updatePokerChatMessage(PokerChatMessage pokerChatMessage)
    {
        return pokerChatMessageMapper.updatePokerChatMessage(pokerChatMessage);
    }

    /**
     * 批量删除游戏房间聊天记录
     * 
     * @param messageIds 需要删除的游戏房间聊天记录主键
     * @return 结果
     */
    @Override
    public int deletePokerChatMessageByMessageIds(Long[] messageIds)
    {
        return pokerChatMessageMapper.deletePokerChatMessageByMessageIds(messageIds);
    }

    /**
     * 删除游戏房间聊天记录信息
     * 
     * @param messageId 游戏房间聊天记录主键
     * @return 结果
     */
    @Override
    public int deletePokerChatMessageByMessageId(Long messageId)
    {
        return pokerChatMessageMapper.deletePokerChatMessageByMessageId(messageId);
    }
}
