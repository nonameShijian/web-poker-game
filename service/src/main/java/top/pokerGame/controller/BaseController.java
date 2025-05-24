package top.pokergame.controller;

import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BaseController<T, M extends IService<T>> {
    /**
     * 实体
     */
    @Autowired
    public T entity;

    /**
     * 服务
     */
    @Autowired
    public M service;

    /**
     * 根据id查询单个数据
     */
    public T selectById(int id) {
        return service.getBaseMapper().selectById(id);
    }

    /**
     * 查询所有数据
     */
    public List<T> selectAll() {
        return service.getBaseMapper().selectList(null);
    }

    /**
     * 插入单个数据
     */
    public boolean insert(T entity) {
        return service.save(entity);
    }

    /**
     * 插入多个数据
     */
    public boolean insertBatch(List<T> entityList) {
        return service.saveBatch(entityList);
    }

    /**
     * 删除单个数据
     */
    public boolean deleteById(int id) {
        return service.removeById(id);
    }

    /**
     * 删除多个数据
     */
    public boolean deleteByIds(List<Integer> ids) {
        return service.removeByIds(ids);
    }

    /**
     * 更新单个数据
     */
    public boolean update(T entity) {
        return service.updateById(entity);
    }

    /**
     * 更新多个数据
     */
    public boolean updateBatchById(List<T> entityList) {
        return service.updateBatchById(entityList);
    }
}
