package top.pokergame.service.impl;

import top.pokergame.entity.UserGameStats;
import top.pokergame.mapper.UserGameStatsMapper;
import top.pokergame.service.IUserGameStatsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户游戏胜负统计表 服务实现类
 * </p>
 *
 * @author Song
 * @since 2025-04-21
 */
@Service
public class UserGameStatsServiceImpl extends ServiceImpl<UserGameStatsMapper, UserGameStats> implements IUserGameStatsService {

}
