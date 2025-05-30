package com.webPokerGame.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.webPokerGame.mapper.PokerUserGameInfoMapper;
import com.webPokerGame.domain.PokerUserGameInfo;
import com.webPokerGame.service.IPokerUserGameInfoService;

/**
 * 用护胜负情况Service业务层处理
 * 
 * @author lwy
 * @date 2025-05-25
 */
@Service
public class PokerUserGameInfoServiceImpl implements IPokerUserGameInfoService 
{
    @Autowired
    private PokerUserGameInfoMapper pokerUserGameInfoMapper;

    /**
     * 查询用护胜负情况
     * 
     * @param id 用护胜负情况主键
     * @return 用护胜负情况
     */
    @Override
    public PokerUserGameInfo selectPokerUserGameInfoById(Long id)
    {
        return pokerUserGameInfoMapper.selectPokerUserGameInfoById(id);
    }

    /**
     * 查询用护胜负情况列表
     * 
     * @param pokerUserGameInfo 用护胜负情况
     * @return 用护胜负情况
     */
    @Override
    public List<PokerUserGameInfo> selectPokerUserGameInfoList(PokerUserGameInfo pokerUserGameInfo)
    {
        return pokerUserGameInfoMapper.selectPokerUserGameInfoList(pokerUserGameInfo);
    }

    /**
     * 新增用护胜负情况
     * 
     * @param pokerUserGameInfo 用护胜负情况
     * @return 结果
     */
    @Override
    public int insertPokerUserGameInfo(PokerUserGameInfo pokerUserGameInfo)
    {
        return pokerUserGameInfoMapper.insertPokerUserGameInfo(pokerUserGameInfo);
    }

    /**
     * 修改用护胜负情况
     * 
     * @param pokerUserGameInfo 用护胜负情况
     * @return 结果
     */
    @Override
    public int updatePokerUserGameInfo(PokerUserGameInfo pokerUserGameInfo)
    {
        return pokerUserGameInfoMapper.updatePokerUserGameInfo(pokerUserGameInfo);
    }

    /**
     * 批量删除用护胜负情况
     * 
     * @param ids 需要删除的用护胜负情况主键
     * @return 结果
     */
    @Override
    public int deletePokerUserGameInfoByIds(Long[] ids)
    {
        return pokerUserGameInfoMapper.deletePokerUserGameInfoByIds(ids);
    }

    /**
     * 删除用护胜负情况信息
     * 
     * @param id 用护胜负情况主键
     * @return 结果
     */
    @Override
    public int deletePokerUserGameInfoById(Long id)
    {
        return pokerUserGameInfoMapper.deletePokerUserGameInfoById(id);
    }
}
