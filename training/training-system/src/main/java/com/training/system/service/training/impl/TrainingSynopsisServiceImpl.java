package com.training.system.service.training.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingShare;
import com.training.system.domain.training.TrainingSynopsis;
import com.training.system.mapper.training.TrainingSynopsisMapper;
import com.training.system.service.training.ITrainingSynopsisService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
@Service
@Transactional(rollbackFor = Exception.class)
public class TrainingSynopsisServiceImpl extends ServiceImpl<TrainingSynopsisMapper, TrainingSynopsis> implements ITrainingSynopsisService {
    /**
     * pc查询领培训封面列表
     *
     * @param synopsis
     */
    @Override
    public List<TrainingSynopsis> getSynopsisList(TrainingSynopsis synopsis) {
        List<TrainingSynopsis> trainingSynopses = baseMapper.selectList(
                Wrappers.<TrainingSynopsis>query().lambda()
                        .eq(TrainingSynopsis::getType, synopsis.getType())
        );
        return trainingSynopses;
    }

    /**
     * pc查询领培训封面
     *
     * @param synopsis
     */
    @Override
    public TrainingSynopsis getSynopsis(TrainingSynopsis synopsis) {
        TrainingSynopsis trainingSynopsis = baseMapper.selectOne(
                Wrappers.<TrainingSynopsis>query().lambda()
                        .eq(TrainingSynopsis::getType, synopsis.getType())
        );
        return trainingSynopsis;
    }

    /**
     * 新增培训封面
     *
     * @param synopsis
     */
    @Override
    public boolean addSynopsis(TrainingSynopsis synopsis) {
        synopsis.setCreateBy(SecurityUtils.getUsername());
        synopsis.setCreateTime(new Date());
        boolean save = save(synopsis);
        return save;
    }

    /**
     * 修改培训封面
     *
     * @param synopsis
     */
    @Override
    public boolean updateSynopsis(TrainingSynopsis synopsis) {
        synopsis.setUpdateBy(SecurityUtils.getUsername());
        synopsis.setUpdateTime(new Date());
        boolean update = updateById(synopsis);
        return update;
    }

    /**
     * 删除除培训封面
     *
     * @param id
     */
    @Override
    public boolean deleteSynopsis(Long id) {
        return false;
    }

    /**
     * 批量删除培训封面
     *
     * @param ids
     */
    @Override
    public boolean deleteSynopsiss(Long[] ids) {
        return false;
    }

    /**
     * 手机查询领培训封面列表
     *
     * @param year
     */
    @Override
    public List<TrainingSynopsis> getMSynopsisList(String year) {
        return null;
    }
}
