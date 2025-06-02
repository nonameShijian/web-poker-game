import com.webPokerGame.domain.PokerGamingInfo;
import com.webPokerGame.service.IPokerRaceGamingService;
import com.webPokerGame.service.impl.PokerRaceGamingServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

public class MyTest {


    public static void main(String[] args) {

        PokerGamingInfo pokerGamingInfo = new PokerGamingInfo();
        pokerGamingInfo.setPlayerAId(1);
        pokerGamingInfo.setPlayerBId(2);
        pokerGamingInfo.setPlayerCId(3);
        pokerGamingInfo.setPlayerDId(4);
        pokerGamingInfo.setPlayerAName("p1");
        pokerGamingInfo.setPlayerBName("p2");
        pokerGamingInfo.setPlayerCName("p3");
        pokerGamingInfo.setPlayerDName("p4");

        PokerRaceGamingServiceImpl pokerRaceGamingService = new PokerRaceGamingServiceImpl();

        System.out.println(pokerRaceGamingService.createRace(pokerGamingInfo));

    }

}
