package com.webPokerGame.service;

import com.webPokerGame.domain.PokerGamingInfo;

/**
 * 游戏中相关信息
 *
 * @author lwy
 * @date 2025-06-01
 */
public interface IPokerRaceGamingService {

    // 创建一场比赛
    PokerGamingInfo createRace(PokerGamingInfo pokerGamingInfo);

    // 开始比赛
    PokerGamingInfo startRace(PokerGamingInfo pokerGamingInfo);

    // 开始比赛第一回合
    PokerGamingInfo startGaming(PokerGamingInfo pokerGamingInfo);

    // 开始比赛中新回合
    PokerGamingInfo startGaming(PokerGamingInfo pokerGamingInfo, Integer playerId);

    // 发牌（无指认）
    PokerGamingInfo dealingCards(PokerGamingInfo gameInfo);

    // 发牌（指认首发）
    PokerGamingInfo dealingCards(PokerGamingInfo pokerGamingInfo, Integer playerId);

    // 更新 redis 中的比赛信息
    Boolean updatePokerGamingInfo(PokerGamingInfo pokerGamingInfo);

    // 获得 redis 中的比赛信息
    PokerGamingInfo getPokerGamingInfo(String raceId);

}
