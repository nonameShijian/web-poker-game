package top.pokergame;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

@SpringBootApplication
@MapperScan("top.pokergame.mapper")
@EnableWebSocket
public class PokerGameApplication {

	public static void main(String[] args) {
		SpringApplication.run(PokerGameApplication.class, args);
	}

}
