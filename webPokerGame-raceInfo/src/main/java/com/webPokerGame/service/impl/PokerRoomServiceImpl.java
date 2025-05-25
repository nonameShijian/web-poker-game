package com.webPokerGame.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.webPokerGame.mapper.PokerRoomMapper;
import com.webPokerGame.domain.PokerRoom;
import com.webPokerGame.service.IPokerRoomService;

/**
 * 游戏房间信息Service业务层处理
 * 
 * @author lwy
 * @date 2025-05-25
 */
@Service
public class PokerRoomServiceImpl implements IPokerRoomService 
{
    @Autowired
    private PokerRoomMapper pokerRoomMapper;

    /**
     * 查询游戏房间信息
     * 
     * @param roomId 游戏房间信息主键
     * @return 游戏房间信息
     */
    @Override
    public PokerRoom selectPokerRoomByRoomId(Long roomId)
    {
        return pokerRoomMapper.selectPokerRoomByRoomId(roomId);
    }

    /**
     * 查询游戏房间信息列表
     * 
     * @param pokerRoom 游戏房间信息
     * @return 游戏房间信息
     */
    @Override
    public List<PokerRoom> selectPokerRoomList(PokerRoom pokerRoom)
    {
        return pokerRoomMapper.selectPokerRoomList(pokerRoom);
    }

    /**
     * 新增游戏房间信息
     * 
     * @param pokerRoom 游戏房间信息
     * @return 结果
     */
    @Override
    public int insertPokerRoom(PokerRoom pokerRoom)
    {
        return pokerRoomMapper.insertPokerRoom(pokerRoom);
    }

    /**
     * 修改游戏房间信息
     * 
     * @param pokerRoom 游戏房间信息
     * @return 结果
     */
    @Override
    public int updatePokerRoom(PokerRoom pokerRoom)
    {
        return pokerRoomMapper.updatePokerRoom(pokerRoom);
    }

    /**
     * 批量删除游戏房间信息
     * 
     * @param roomIds 需要删除的游戏房间信息主键
     * @return 结果
     */
    @Override
    public int deletePokerRoomByRoomIds(Long[] roomIds)
    {
        return pokerRoomMapper.deletePokerRoomByRoomIds(roomIds);
    }

    /**
     * 删除游戏房间信息信息
     * 
     * @param roomId 游戏房间信息主键
     * @return 结果
     */
    @Override
    public int deletePokerRoomByRoomId(Long roomId)
    {
        return pokerRoomMapper.deletePokerRoomByRoomId(roomId);
    }
}
