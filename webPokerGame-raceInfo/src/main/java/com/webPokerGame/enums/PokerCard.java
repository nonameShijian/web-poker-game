package com.webPokerGame.enums;

import lombok.Getter;

/*
 * 扑克卡牌信息枚举类
 */
@Getter
public enum PokerCard {

    // SPADES 黑桃
    SPADE_A("SPADE", "A", 14),
    SPADE_2("SPADE", "2", 15),
    SPADE_3("SPADE", "3", 3),
    SPADE_4("SPADE", "4", 4),
    SPADE_5("SPADE", "5", 5),
    SPADE_6("SPADE", "6", 6),
    SPADE_7("SPADE", "7", 7),
    SPADE_8("SPADE", "8", 8),
    SPADE_9("SPADE", "9", 9),
    SPADE_10("SPADE", "10", 10),
    SPADE_J("SPADE", "J", 11),
    SPADE_Q("SPADE", "Q", 12),
    SPADE_K("SPADE", "K", 13),

    // HEARTS 红桃
    HEART_A("HEART", "A", 14),
    HEART_2("HEART", "2", 15),
    HEART_3("HEART", "3", 3),
    HEART_4("HEART", "4", 4),
    HEART_5("HEART", "5", 5),
    HEART_6("HEART", "6", 6),
    HEART_7("HEART", "7", 7),
    HEART_8("HEART", "8", 8),
    HEART_9("HEART", "9", 9),
    HEART_10("HEART", "10", 10),
    HEART_J("HEART", "J", 11),
    HEART_Q("HEART", "Q", 12),
    HEART_K("HEART", "K", 13),

    // CLUBS 梅花
    CLUB_A("CLUB", "A", 14),
    CLUB_2("CLUB", "2", 15),
    CLUB_3("CLUB", "3", 3),
    CLUB_4("CLUB", "4", 4),
    CLUB_5("CLUB", "5", 5),
    CLUB_6("CLUB", "6", 6),
    CLUB_7("CLUB", "7", 7),
    CLUB_8("CLUB", "8", 8),
    CLUB_9("CLUB", "9", 9),
    CLUB_10("CLUB", "10", 10),
    CLUB_J("CLUB", "J", 11),
    CLUB_Q("CLUB", "Q", 12),
    CLUB_K("CLUB", "K", 13),

    // DIAMONDS 方块
    DIAMOND_A("DIAMOND", "A", 14),
    DIAMOND_2("DIAMOND", "2", 15),
    DIAMOND_3("DIAMOND", "3", 3),
    DIAMOND_4("DIAMOND", "4", 4),
    DIAMOND_5("DIAMOND", "5", 5),
    DIAMOND_6("DIAMOND", "6", 6),
    DIAMOND_7("DIAMOND", "7", 7),
    DIAMOND_8("DIAMOND", "8", 8),
    DIAMOND_9("DIAMOND", "9", 9),
    DIAMOND_10("DIAMOND", "10", 10),
    DIAMOND_J("DIAMOND", "J", 11),
    DIAMOND_Q("DIAMOND", "Q", 12),
    DIAMOND_K("DIAMOND", "K", 13),

    // JOKER 大小王
    JOKER_SMALL("JOKER", "SMALL", 19),
    JOKER_BIG("JOKER", "BIG", 20);

    // 花色
    private final String suit;

    // 展示值
    private final String showValue;

    // 计算值
    private final Integer computeValue;

    PokerCard(String suit, String showValue, Integer computeValue) {
        this.suit = suit;
        this.showValue = showValue;
        this.computeValue = computeValue;
    }

    @Override
    public String toString() {
        return suit + " " + showValue + " " + computeValue;
    }
}