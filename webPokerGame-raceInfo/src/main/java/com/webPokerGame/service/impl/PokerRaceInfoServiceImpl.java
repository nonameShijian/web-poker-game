package com.webPokerGame.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.webPokerGame.mapper.PokerRaceInfoMapper;
import com.webPokerGame.domain.PokerRaceInfo;
import com.webPokerGame.service.IPokerRaceInfoService;

/**
 * 历史比赛信息Service业务层处理
 * 
 * @author lwy
 * @date 2025-05-25
 */
@Service
public class PokerRaceInfoServiceImpl implements IPokerRaceInfoService 
{
    @Autowired
    private PokerRaceInfoMapper pokerRaceInfoMapper;

    /**
     * 查询历史比赛信息
     * 
     * @param id 历史比赛信息主键
     * @return 历史比赛信息
     */
    @Override
    public PokerRaceInfo selectPokerRaceInfoById(Long id)
    {
        return pokerRaceInfoMapper.selectPokerRaceInfoById(id);
    }

    /**
     * 查询历史比赛信息列表
     * 
     * @param pokerRaceInfo 历史比赛信息
     * @return 历史比赛信息
     */
    @Override
    public List<PokerRaceInfo> selectPokerRaceInfoList(PokerRaceInfo pokerRaceInfo)
    {
        return pokerRaceInfoMapper.selectPokerRaceInfoList(pokerRaceInfo);
    }

    /**
     * 新增历史比赛信息
     * 
     * @param pokerRaceInfo 历史比赛信息
     * @return 结果
     */
    @Override
    public int insertPokerRaceInfo(PokerRaceInfo pokerRaceInfo)
    {
        return pokerRaceInfoMapper.insertPokerRaceInfo(pokerRaceInfo);
    }

    /**
     * 修改历史比赛信息
     * 
     * @param pokerRaceInfo 历史比赛信息
     * @return 结果
     */
    @Override
    public int updatePokerRaceInfo(PokerRaceInfo pokerRaceInfo)
    {
        return pokerRaceInfoMapper.updatePokerRaceInfo(pokerRaceInfo);
    }

    /**
     * 批量删除历史比赛信息
     * 
     * @param ids 需要删除的历史比赛信息主键
     * @return 结果
     */
    @Override
    public int deletePokerRaceInfoByIds(Long[] ids)
    {
        return pokerRaceInfoMapper.deletePokerRaceInfoByIds(ids);
    }

    /**
     * 删除历史比赛信息信息
     * 
     * @param id 历史比赛信息主键
     * @return 结果
     */
    @Override
    public int deletePokerRaceInfoById(Long id)
    {
        return pokerRaceInfoMapper.deletePokerRaceInfoById(id);
    }
}
