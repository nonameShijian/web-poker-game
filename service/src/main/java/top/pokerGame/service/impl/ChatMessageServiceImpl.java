package top.pokergame.service.impl;

import top.pokergame.entity.ChatMessage;
import top.pokergame.mapper.ChatMessageMapper;
import top.pokergame.service.IChatMessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 游戏房间聊天记录表 服务实现类
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
@Service
public class ChatMessageServiceImpl extends ServiceImpl<ChatMessageMapper, ChatMessage> implements IChatMessageService {

}
