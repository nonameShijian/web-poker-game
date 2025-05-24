package top.pokergame.entity;

import com.alibaba.fastjson.JSON;
import lombok.Getter;
import java.util.*;

/**
 * 扑克牌类
 */
@Getter
public class PokerCard {

    // 花色枚举（返回小写字符串）
    public enum Suit {
        HEARTS("hearts"),
        DIAMONDS("diamonds"),
        CLUBS("clubs"),
        SPADES("spades");

        private final String value;

        Suit(String value) {
            this.value = value;
        }

        @Override
        public String toString() {
            return value;
        }
    }

    /**
     * 扑克牌牌型枚举
     */
    public enum HandType {
        SINGLE,         // 单张
        PAIR,           // 对子
        STRAIGHT,       // 顺子
        BOMB,           // 炸弹（三张或以上）
        JOKER_BOMB,     // 王炸
        INVALID         // 无效牌型
    }

    private final Suit suit;      // 花色
    private final int rank;       // 点数（1-15）

    public PokerCard(Suit suit, int rank) {
        if (rank < 1 || rank > 15) {
            throw new IllegalArgumentException("点数必须在1到15之间");
        }
        this.suit = suit;
        this.rank = rank;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }

    /**
     * 洗牌方法
     *
     * @param deck 扑克牌列表
     */
    public static void shuffle(List<PokerCard> deck) {
        Collections.shuffle(deck);
    }

    /**
     * 一般情况下的比较两张牌的大小
     *
     * @param card1 第一张牌
     * @param card2 第二张牌
     * @return 1如果card1大，-1如果card2大，0平局
     */
    public static int compare(PokerCard card1, PokerCard card2) {
        if (card1.getRank() > card2.getRank()) {
            return 1;
        } else if (card1.getRank() < card2.getRank()) {
            return -1;
        } else {
            return 0;
        }
    }

    /**
     * 带立棍规则的比较器
     *
     * @param card1              第一张牌
     * @param card2              第二张牌
     * @param currentWildcardRank 当前局设定的立棍点数（x）
     * @return 1如果card1大，-1如果card2大，0平局
     */
    public static int compareWithWildCard(PokerCard card1, PokerCard card2, Integer currentWildcardRank) {
        if (currentWildcardRank == null || currentWildcardRank < 1 || currentWildcardRank > 15) {
            return compare(card1, card2); // 没有立棍或无效值时使用常规比较
        }

        int rank1 = card1.getRank();
        int rank2 = card2.getRank();

        // 如果两张都不是立棍点数，直接按普通规则比较
        boolean isCard1Wild = rank1 == currentWildcardRank;
        boolean isCard2Wild = rank2 == currentWildcardRank;

        if (!isCard1Wild && !isCard2Wild) {
            return compare(card1, card2);
        }

        // 只有其中一个是立棍点数
        if (isCard1Wild && !isCard2Wild) {
            return 1; // 立棍牌胜出
        } else if (!isCard1Wild && isCard2Wild) {
            return -1;
        }

        // 同是立棍点数，特殊规则：红桃 > 其他任意
        if (card1.getSuit() == Suit.HEARTS && card2.getSuit() != Suit.HEARTS) {
            return 1;
        } else if (card1.getSuit() != Suit.HEARTS && card2.getSuit() == Suit.HEARTS) {
            return -1;
        } else {
            return 0;
        }
    }

    /**
     * 判定是否为顺子（排除立棍点数 x 的牌）
     *
     * @param cards               牌列表（>=3张）
     * @param currentWildcardRank 当前局设定的立棍点数（x）
     * @return 是否为顺子
     */
    public static boolean isStraight(List<PokerCard> cards, Integer currentWildcardRank) {
        if (cards.size() < 4) {
            throw new IllegalArgumentException("顺子判断需要3张牌或以上");
        }

        List<Integer> ranks = new ArrayList<>();

        for (PokerCard card : cards) {
            int r = card.getRank();
            if (currentWildcardRank != null && r == currentWildcardRank) {
                // 立棍点数的牌不能参与构成顺子
                return false;
            }
            ranks.add(r);
        }

        if (ranks.contains(2)) return false;
        if (ranks.contains(14)) return false;
        if (ranks.contains(15)) return false;

        Collections.sort(ranks);

        // 处理 10-J-Q-K-A 顺子（将 A 视为 14）
        if (ranks.contains(1)) {
            List<Integer> highRanks = new ArrayList<>();
            for (int r : ranks) {
                highRanks.add(r == 1 ? 14 : r);
            }
            Collections.sort(highRanks);
            if (highRanks.get(highRanks.size() - 1) - highRanks.get(0) == highRanks.size() - 1) {
                return true;
            }
        }

        for (int i = 0; i < ranks.size() - 1; i++) {
            if (ranks.get(i + 1) - ranks.get(i) != 1) {
                return false;
            }
        }
        return true;
    }

    public static boolean isStraight(List<PokerCard> cards) {
        return isStraight(cards, null);
    }

    /**
     * 判定是否为对子
     *
     * @param cards 牌列表（5张）
     * @return 是否为对子
     */
    public static boolean isOnePair(List<PokerCard> cards) {
        Map<Integer, Integer> rankCountMap = new HashMap<>();

        for (PokerCard card : cards) {
            rankCountMap.put(card.getRank(), rankCountMap.getOrDefault(card.getRank(), 0) + 1);
        }

        for (int count : rankCountMap.values()) {
            if (count == 2) {
                return true;
            }
        }
        return false;
    }

    /**
     * 判定是否为炸弹（四张相同点数）
     *
     * @param cards 牌列表（4张）
     * @return 是否为炸弹
     */
    public static boolean isBomb(List<PokerCard> cards) {
        if (cards.size() < 3) {
            throw new IllegalArgumentException("炸弹判定需要3张牌或以上");
        }

        int firstRank = cards.get(0).getRank();
        for (int i = 1; i < cards.size(); i++) {
            if (cards.get(i).getRank() != firstRank) {
                return false;
            }
        }
        return true;
    }

    /**
     * 判定是否为双王炸弹（红桃15 + 黑桃14）
     *
     * @param cards 牌列表（2张）
     * @return 是否为双王炸弹
     */
    public static boolean isJokerBomb(List<PokerCard> cards) {
        if (cards.size() != 2) {
            return false;
        }

        PokerCard card1 = cards.get(0);
        PokerCard card2 = cards.get(1);

        boolean isJoker1 = card1.getSuit() == Suit.HEARTS && card1.getRank() == 15; // 大王
        boolean isJoker2 = card2.getSuit() == Suit.SPADES && card2.getRank() == 14; // 小王

        boolean isReverseJoker1 = card1.getSuit() == Suit.SPADES && card1.getRank() == 14;
        boolean isReverseJoker2 = card2.getSuit() == Suit.HEARTS && card2.getRank() == 15;

        return (isJoker1 && isJoker2) || (isReverseJoker1 && isReverseJoker2);
    }

    /**
     * 获取牌型
     *
     * @param cards 牌列表
     * @return 牌型
     */
    public static HandType getHandType(List<PokerCard> cards) {
        if (cards == null || cards.size() == 0) {
            return HandType.INVALID;
        }

        switch (cards.size()) {
            case 1:
                return HandType.SINGLE;
            case 2:
                if (isOnePair(cards)) return HandType.PAIR;
                else if (isJokerBomb(cards)) return HandType.JOKER_BOMB;
                return HandType.INVALID;
            case 3:
            case 4:
            case 5:
                if (isStraight(cards)) return HandType.STRAIGHT;
                else if (isBomb(cards)) return HandType.BOMB;
                else return HandType.INVALID;
            default:
                return HandType.INVALID;
        }
    }

    /**
     * 判定是否为葫芦（三带二）
     *
     * @param cards 牌列表（5张）
     * @return 是否为葫芦
     */
    public static boolean isFullHouse(List<PokerCard> cards) {
        if (cards.size() != 5) return false;

        Map<Integer, Integer> rankCountMap = new HashMap<>();
        for (PokerCard card : cards) {
            rankCountMap.put(card.getRank(), rankCountMap.getOrDefault(card.getRank(), 0) + 1);
        }

        return rankCountMap.containsValue(3) && rankCountMap.containsValue(2);
    }

    /**
     * 初始化一副标准扑克牌（52张，不含大小王）
     *
     * @return 扑克牌列表
     */
    public static List<PokerCard> initializeDeck() {
        List<PokerCard> deck = new ArrayList<>();

        for (Suit suit : Suit.values()) {
            for (int rank = 1; rank <= 15; rank++) {
                deck.add(new PokerCard(suit, rank));
            }
        }

        return deck;
    }

    /**
     * 初始化一副标准扑克牌（含大小王）
     *
     * @return 扑克牌列表（54张：52张普通牌 + 2张王牌）
     */
    public static List<PokerCard> initializeDeckWithJokers() {
        List<PokerCard> deck = new ArrayList<>();

        // 添加四种花色的常规牌（A-K，1-13）
        for (Suit suit : Suit.values()) {
            for (int rank = 1; rank <= 13; rank++) {
                deck.add(new PokerCard(suit, rank));
            }
        }

        // 添加两张王牌（通常为黑桃和红桃的0点或特殊点数）
        deck.add(new PokerCard(Suit.SPADES, 14)); // 小王
        deck.add(new PokerCard(Suit.HEARTS, 15)); // 大王

        return deck;
    }
}
