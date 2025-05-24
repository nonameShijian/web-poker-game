package top.pokergame.entity;

import jakarta.websocket.Session;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class WsUser extends User {
    private Session session;
    private Integer roomId;
    private LocalDateTime lastHeartbeatTime;

    /**
     * 最后一次收到 pong 的时间
     */
    private LocalDateTime lastPongTime = LocalDateTime.now();

    public void updatePongTime() {
        this.lastPongTime = LocalDateTime.now();
    }

    public WsUser(User user) {
        this.setUserFields(user);
        this.lastHeartbeatTime = LocalDateTime.now();
    }

    public WsUser() {
        super();
        this.lastHeartbeatTime = LocalDateTime.now();
    }

    private void setUserFields(User user) {
        this.setUserId(user.getUserId());
        this.setUsername(user.getUsername());
        this.setSex(user.getSex());
        this.setPassword(user.getPassword());
        this.setPhoto(user.getPhoto());
        this.setStatus(user.getStatus());
        this.setRole(user.getRole());
        this.setEmail(user.getEmail());
        this.setLocked(user.isLocked());
        this.setLoginFailCount(user.getLoginFailCount());
        this.setLastLoginFailTime(user.getLastLoginFailTime());
    }

    public void updateHeartbeat() {
        this.lastHeartbeatTime = LocalDateTime.now();
    }

    public boolean isOnline() {
        return session != null && session.isOpen();
    }

    @Override
    public String toString() {
        return super.toString();
    }
}

