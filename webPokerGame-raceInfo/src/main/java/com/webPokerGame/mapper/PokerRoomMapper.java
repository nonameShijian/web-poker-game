package com.webPokerGame.mapper;

import java.util.List;
import com.webPokerGame.domain.PokerRoom;

/**
 * 游戏房间信息Mapper接口
 * 
 * @author lwy
 * @date 2025-05-25
 */
public interface PokerRoomMapper 
{
    /**
     * 查询游戏房间信息
     * 
     * @param roomId 游戏房间信息主键
     * @return 游戏房间信息
     */
    public PokerRoom selectPokerRoomByRoomId(Long roomId);

    /**
     * 查询游戏房间信息列表
     * 
     * @param pokerRoom 游戏房间信息
     * @return 游戏房间信息集合
     */
    public List<PokerRoom> selectPokerRoomList(PokerRoom pokerRoom);

    /**
     * 新增游戏房间信息
     * 
     * @param pokerRoom 游戏房间信息
     * @return 结果
     */
    public int insertPokerRoom(PokerRoom pokerRoom);

    /**
     * 修改游戏房间信息
     * 
     * @param pokerRoom 游戏房间信息
     * @return 结果
     */
    public int updatePokerRoom(PokerRoom pokerRoom);

    /**
     * 删除游戏房间信息
     * 
     * @param roomId 游戏房间信息主键
     * @return 结果
     */
    public int deletePokerRoomByRoomId(Long roomId);

    /**
     * 批量删除游戏房间信息
     * 
     * @param roomIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePokerRoomByRoomIds(Long[] roomIds);
}
