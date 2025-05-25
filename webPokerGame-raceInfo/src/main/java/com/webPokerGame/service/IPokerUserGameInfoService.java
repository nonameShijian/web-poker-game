package com.webPokerGame.service;

import java.util.List;
import com.webPokerGame.domain.PokerUserGameInfo;

/**
 * 用护胜负情况Service接口
 * 
 * @author lwy
 * @date 2025-05-25
 */
public interface IPokerUserGameInfoService 
{
    /**
     * 查询用护胜负情况
     * 
     * @param id 用护胜负情况主键
     * @return 用护胜负情况
     */
    public PokerUserGameInfo selectPokerUserGameInfoById(Long id);

    /**
     * 查询用护胜负情况列表
     * 
     * @param pokerUserGameInfo 用护胜负情况
     * @return 用护胜负情况集合
     */
    public List<PokerUserGameInfo> selectPokerUserGameInfoList(PokerUserGameInfo pokerUserGameInfo);

    /**
     * 新增用护胜负情况
     * 
     * @param pokerUserGameInfo 用护胜负情况
     * @return 结果
     */
    public int insertPokerUserGameInfo(PokerUserGameInfo pokerUserGameInfo);

    /**
     * 修改用护胜负情况
     * 
     * @param pokerUserGameInfo 用护胜负情况
     * @return 结果
     */
    public int updatePokerUserGameInfo(PokerUserGameInfo pokerUserGameInfo);

    /**
     * 批量删除用护胜负情况
     * 
     * @param ids 需要删除的用护胜负情况主键集合
     * @return 结果
     */
    public int deletePokerUserGameInfoByIds(Long[] ids);

    /**
     * 删除用护胜负情况信息
     * 
     * @param id 用护胜负情况主键
     * @return 结果
     */
    public int deletePokerUserGameInfoById(Long id);
}
