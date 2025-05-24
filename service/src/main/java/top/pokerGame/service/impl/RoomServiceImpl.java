package top.pokergame.service.impl;

import top.pokergame.entity.Room;
import top.pokergame.mapper.RoomMapper;
import top.pokergame.service.IRoomService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 游戏房间信息表 服务实现类
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
@Service
public class RoomServiceImpl extends ServiceImpl<RoomMapper, Room> implements IRoomService {

}
