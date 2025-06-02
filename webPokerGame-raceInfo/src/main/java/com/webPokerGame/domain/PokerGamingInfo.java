package com.webPokerGame.domain;

import com.webPokerGame.enums.PokerCard;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PokerGamingInfo {

    // 数据id
    Integer id;

    // 比赛id
    String raceId;

    // 各用户id
    Integer playerAId;
    Integer playerBId;
    Integer playerCId;
    Integer playerDId;

    // 各用户名称
    String playerAName;
    String playerBName;
    String playerCName;
    String playerDName;

    // 各用户手牌
    List<PokerCard> playerAPokerCards;
    List<PokerCard> playerBPokerCards;
    List<PokerCard> playerCPokerCards;
    List<PokerCard> playerDPokerCards;

    // 队伍A
    List<Integer> teamA;
    // 队伍B
    List<Integer> teamB;

    // 队伍A积分
    Integer teamAScore;

    // 队伍B积分
    Integer teamBScore;

    // 当前升级牌
    PokerCard risePokerCard;

}
