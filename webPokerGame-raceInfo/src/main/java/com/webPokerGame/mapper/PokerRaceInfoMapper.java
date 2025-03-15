package com.webPokerGame.mapper;

import java.util.List;
import com.webPokerGame.domain.PokerRaceInfo;

/**
 * 历史比赛信息Mapper接口
 * 
 * @author lwy
 * @date 2025-03-15
 */
public interface PokerRaceInfoMapper 
{
    /**
     * 查询历史比赛信息
     * 
     * @param id 历史比赛信息主键
     * @return 历史比赛信息
     */
    public PokerRaceInfo selectPokerRaceInfoById(Long id);

    /**
     * 查询历史比赛信息列表
     * 
     * @param pokerRaceInfo 历史比赛信息
     * @return 历史比赛信息集合
     */
    public List<PokerRaceInfo> selectPokerRaceInfoList(PokerRaceInfo pokerRaceInfo);

    /**
     * 新增历史比赛信息
     * 
     * @param pokerRaceInfo 历史比赛信息
     * @return 结果
     */
    public int insertPokerRaceInfo(PokerRaceInfo pokerRaceInfo);

    /**
     * 修改历史比赛信息
     * 
     * @param pokerRaceInfo 历史比赛信息
     * @return 结果
     */
    public int updatePokerRaceInfo(PokerRaceInfo pokerRaceInfo);

    /**
     * 删除历史比赛信息
     * 
     * @param id 历史比赛信息主键
     * @return 结果
     */
    public int deletePokerRaceInfoById(Long id);

    /**
     * 批量删除历史比赛信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePokerRaceInfoByIds(Long[] ids);
}
