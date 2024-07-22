package com.training.system.service.training.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingPeriodical;
import com.training.system.mapper.training.TrainingPeriodicalMapper;
import com.training.system.service.training.ITrainingPeriodicalService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional(rollbackFor = Exception.class)
public class TrainingPeriodicalServiceImpl extends ServiceImpl<TrainingPeriodicalMapper, TrainingPeriodical> implements ITrainingPeriodicalService {

    @Resource
    private TrainingPeriodicalMapper trainingPeriodicalMapper;

    /**
     * pc查询领文章介绍列表
     */
    @Override
    public List<TrainingPeriodical> getPeriodicalList(TrainingPeriodical periodical) {
        List<TrainingPeriodical> periodicals = this.list(Wrappers.<TrainingPeriodical>query().lambda()
                .eq(Optional.ofNullable(periodical.getType()).isPresent(), TrainingPeriodical::getType, periodical.getType())
                .like(Optional.ofNullable(periodical.getAuthor()).isPresent(),TrainingPeriodical::getAuthor, periodical.getAuthor())
                .like(Optional.ofNullable(periodical.getTitle()).isPresent(),TrainingPeriodical::getTitle, periodical.getTitle())
                .orderByDesc(TrainingPeriodical::getSeq)
                .orderByDesc(TrainingPeriodical::getCreateTime));
        return periodicals;
    }
    /**
     * 手机查询领文章介绍详情
     */
    @Override
    public List<TrainingPeriodical> getMPeriodicalList(String type) {

        List<TrainingPeriodical> periodicals= this.list(Wrappers.<TrainingPeriodical>query().lambda()
                .eq(TrainingPeriodical::getType, type)
                .orderByDesc(TrainingPeriodical::getSeq)
                .orderByDesc(TrainingPeriodical::getCreateTime));
        return periodicals;
    }

    @Override
    public Boolean addPeriodical(TrainingPeriodical periodical) {
        periodical.setCreateBy(SecurityUtils.getUsername());
        periodical.setCreateTime(new Date());
        this.pictures(periodical);
        boolean save = save(periodical);
        return save;
    }

    /**
     * 修改文章介绍
     *
     * @param periodical
     * @return
     */
    @Override
    public boolean updatePeriodical(TrainingPeriodical periodical) {
        periodical.setUpdateBy(SecurityUtils.getUsername());
        periodical.setUpdateTime(new Date());
//        this.pictures(periodical);
        boolean update = updateById(periodical);
        return update;
    }
    private void pictures(TrainingPeriodical periodical) {
        // 判断是否传入图片
        if (periodical.getImageNameList().size() > 0) {
            // 多张图片名字用逗号隔开
            String img = periodical.getImageNameList().stream().map(String::valueOf).collect(Collectors.joining(","));
            periodical.setImageName(img);
        }
    }

    /**
     * 批量删除文章介绍
     */
    @Override
    public boolean deletePeriodicals(Long[] ids) {
        boolean b = removeByIds(Arrays.asList(ids));
        return b;
    }
    /**
     * 删除除文章介绍
     */
    @Override
    public boolean deletePeriodical(Long id) {
        return removeById(id);
    }

    @Override
    public int topPeriodical(TrainingPeriodical periodical) {
        /*置顶最大数*/
        Integer topNum =  trainingPeriodicalMapper.selectTopSeq(periodical.getType());
        if (periodical.getSeq() !=topNum || topNum == 0){
            topNum = topNum+1;
            periodical.setSeq(topNum);
            return trainingPeriodicalMapper.updateById(periodical);
        }
        return 0;
    }

}
