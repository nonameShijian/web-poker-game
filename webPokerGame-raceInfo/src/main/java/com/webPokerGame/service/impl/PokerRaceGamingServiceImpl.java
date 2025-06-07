package com.webPokerGame.service.impl;

import com.webPokerGame.common.exception.ServiceException;
import com.webPokerGame.common.utils.RedisUtils;
import com.webPokerGame.common.utils.uuid.IdUtils;
import com.webPokerGame.domain.PokerGamingInfo;
import com.webPokerGame.enums.PokerCard;
import com.webPokerGame.service.IPokerRaceGamingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class PokerRaceGamingServiceImpl implements IPokerRaceGamingService {

    @Autowired
    RedisUtils redisUtils;

    // 创建一场比赛（用于房间组建阶段）
    @Override
    public PokerGamingInfo createRace(PokerGamingInfo pokerGamingInfo) {

        // 生成比赛的uuid
        pokerGamingInfo.setRaceId(IdUtils.fastUUID());

        // 将数据存入 redis 中
        setRedisGamingInfo(pokerGamingInfo);

        // 返回当前组房情况
        return pokerGamingInfo;
    }

    // 开始比赛
    @Override
    public PokerGamingInfo startRace(PokerGamingInfo pokerGamingInfo) {
        // 检查是否有 uuid
        if (pokerGamingInfo.getRaceId() == null) {
            // 如果没则设置一个
            pokerGamingInfo.setRaceId(IdUtils.fastUUID());
        }

        // 校验参加人员信息齐全
        checkPokerGamingInfo(pokerGamingInfo);

        // 通过校验
        // 开始第一回合
        startGaming(pokerGamingInfo);

        // 返回首次发牌结束的游戏信息
        return pokerGamingInfo;
    }


    // 开始第一回合
    @Override
    public PokerGamingInfo startGaming(PokerGamingInfo pokerGamingInfo) {
        // 如果是第一回合
        dealingCards(pokerGamingInfo);

        // 更新比赛信息
        setRedisGamingInfo(pokerGamingInfo);

        return pokerGamingInfo;
    }


    // 开始新回合
    @Override
    public PokerGamingInfo startGaming(PokerGamingInfo pokerGamingInfo, Integer playerId) {
        // 如果是第一回合
        dealingCards(pokerGamingInfo, playerId);

        // 更新比赛信息
        setRedisGamingInfo(pokerGamingInfo);

        return pokerGamingInfo;
    }


    // 发牌，无指认起始玩家
    @Override
    public PokerGamingInfo dealingCards(PokerGamingInfo gameInfo) {

        // 将四个玩家添加进一个有序集合用于抽取首发人员
        List<Integer> playerList = new ArrayList<>();
        playerList.add(gameInfo.getPlayerAId());
        playerList.add(gameInfo.getPlayerBId());
        playerList.add(gameInfo.getPlayerCId());
        playerList.add(gameInfo.getPlayerDId());

        // 从 0-3 中抽一个整数，这个整数就是首发人员的下标
        int index = ThreadLocalRandom.current().nextInt(0, 4);

        // 进行发牌
        return dealingCards(gameInfo, playerList.get(index));
    }

    // 发牌，指认起始玩家
    @Override
    public PokerGamingInfo dealingCards(PokerGamingInfo gameInfo, Integer startPlayerId) {
        if (gameInfo == null || startPlayerId == null) {
            throw new IllegalArgumentException("gameInfo 或 startPlayerId 不能为空");
        }

        // 通过 map 集合的下标去构建发牌顺序
        // 构造玩家 ID 与手牌列表的映射
        Map<Integer, List<PokerCard>> playerCardMap = new HashMap<>();
        playerCardMap.put(gameInfo.getPlayerAId(), new ArrayList<>());
        playerCardMap.put(gameInfo.getPlayerBId(), new ArrayList<>());
        playerCardMap.put(gameInfo.getPlayerCId(), new ArrayList<>());
        playerCardMap.put(gameInfo.getPlayerDId(), new ArrayList<>());

        // 逆时针发牌顺序列表
        List<Integer> playerOrder = Arrays.asList(
                gameInfo.getPlayerDId(),
                gameInfo.getPlayerCId(),
                gameInfo.getPlayerBId(),
                gameInfo.getPlayerAId()
        );

        // 调整顺序，从指定起始玩家开始
        int startIndex = playerOrder.indexOf(startPlayerId);

        if (startIndex == -1) {
            throw new ServiceException("startPlayerId 不存在于当前玩家中");
        }

        List<Integer> dealOrder = new ArrayList<>();

        // 根据指定的顺序发牌
        for (int i = 0; i < 4; i++) {
            // 制作发牌顺序
            dealOrder.add(playerOrder.get((startIndex + i) % 4));
        }

        // 获得所有卡牌
        List<PokerCard> deck = new ArrayList<>(Arrays.asList(PokerCard.values()));
        // 随机排序洗牌
        Collections.shuffle(deck);

        // 发牌（逆时针轮流发）
        int cardIndex = 0;
        while (cardIndex < deck.size()) {
            for (Integer playerId : dealOrder) {
                if (cardIndex >= deck.size()) break;
                playerCardMap.get(playerId).add(deck.get(cardIndex));
                cardIndex++;
            }
        }

        // 设置回 gameInfo
        gameInfo.setPlayerAPokerCards(playerCardMap.get(gameInfo.getPlayerAId()));
        gameInfo.setPlayerBPokerCards(playerCardMap.get(gameInfo.getPlayerBId()));
        gameInfo.setPlayerCPokerCards(playerCardMap.get(gameInfo.getPlayerCId()));
        gameInfo.setPlayerDPokerCards(playerCardMap.get(gameInfo.getPlayerDId()));

        return gameInfo;
    }

    // 更新 redis 中的比赛数据
    @Override
    public Boolean updatePokerGamingInfo(PokerGamingInfo pokerGamingInfo) {
        return redisUtils.set(pokerGamingInfo.getRaceId(), pokerGamingInfo);
    }

    // 获得 redis 中的比赛数据
    @Override
    public PokerGamingInfo getPokerGamingInfo(String raceId) {
        return getRedisGamingInfo(raceId);
    }

    // 更新 redis 中的比赛数据
    public void setRedisGamingInfo(PokerGamingInfo pokerGamingInfo) {
        if (pokerGamingInfo.getRaceId() == null) {
            throw new ServiceException("比赛信息uuid不可为空");
        }
        boolean set = redisUtils.set(pokerGamingInfo.getRaceId(), pokerGamingInfo);
        if (!set) {
            throw new ServiceException("数据存入 redis 中失败，请检查后台");
        }
    }

    // 获取 redis 中的比赛数据
    public PokerGamingInfo getRedisGamingInfo(String raceId) {
        Object dataInfo = redisUtils.get(raceId);
        if (dataInfo == null) {
            throw new ServiceException("无该场比赛数据");
        }
        return (PokerGamingInfo) dataInfo;
    }

    // 校验比赛信息
    public void checkPokerGamingInfo(PokerGamingInfo info){
        String errorMsg = "";

        if (info == null) {
            errorMsg = "PokerGamingInfo 对象为 null";
            throw new ServiceException(errorMsg);
        }

        // 校验用户ID
        if (info.getPlayerAId() == null || info.getPlayerBId() == null ||
                info.getPlayerCId() == null || info.getPlayerDId() == null) {
            errorMsg = "用户ID不能为空";
            throw new ServiceException(errorMsg);
        }

        // 校验用户名称
        if (isBlank(info.getPlayerAName()) || isBlank(info.getPlayerBName()) ||
                isBlank(info.getPlayerCName()) || isBlank(info.getPlayerDName())) {
            errorMsg = "用户名不能为空";
            throw new ServiceException(errorMsg);
        }

        // 校验队伍A和B
        if (info.getTeamA() == null || info.getTeamA().isEmpty()) {
            errorMsg = "队伍A不能为空";
            throw new ServiceException(errorMsg);
        }

        if (info.getTeamB() == null || info.getTeamB().isEmpty()) {
            errorMsg = "队伍B不能为空";
            throw new ServiceException(errorMsg);
        }

    }

    // 检查字符串是否为空
    private static boolean isBlank(String str) {
        return str == null || str.trim().isEmpty();
    }
}
