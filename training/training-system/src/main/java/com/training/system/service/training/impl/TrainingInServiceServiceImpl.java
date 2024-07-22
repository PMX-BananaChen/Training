package com.training.system.service.training.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingInService;
import com.training.system.mapper.training.TrainingInServiceMapper;
import com.training.system.service.training.ITrainingInServiceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@Transactional(rollbackFor = Exception.class)
public class TrainingInServiceServiceImpl extends ServiceImpl<TrainingInServiceMapper, TrainingInService> implements ITrainingInServiceService {

    @Resource
    private TrainingInServiceMapper trainingInServiceMapper;

    @Override
    public List<TrainingInService> getInServiceList(TrainingInService inService) {
        List<TrainingInService> inServices = this.list(Wrappers.<TrainingInService>query().lambda()
                .eq(Optional.ofNullable(inService.getType()).isPresent(), TrainingInService::getType, inService.getType())
                .like(Optional.ofNullable(inService.getAuthor()).isPresent(),TrainingInService::getAuthor, inService.getAuthor())
                .like(Optional.ofNullable(inService.getTitle()).isPresent(),TrainingInService::getTitle, inService.getTitle())
                .orderByDesc(TrainingInService::getSeq)
                .orderByDesc(TrainingInService::getCreateTime));
        return inServices;
    }

    @Override
    public List<TrainingInService> getMInServiceList(String type) {
        List<TrainingInService> inServices= this.list(Wrappers.<TrainingInService>query().lambda()
                .eq(TrainingInService::getType, type)
                .orderByDesc(TrainingInService::getSeq)
                .orderByDesc(TrainingInService::getCreateTime));
        return inServices;
    }

    @Override
    public boolean updateInService(TrainingInService inService) {
        inService.setUpdateBy(SecurityUtils.getUsername());
        inService.setUpdateTime(new Date());
//        this.pictures(inService);
        boolean update = updateById(inService);
        return update;
    }

    @Override
    public boolean deleteInServices(Long[] ids) {
        boolean b = removeByIds(Arrays.asList(ids));
        return b;
    }

    @Override
    public int topInService(TrainingInService inService) {
        /*置顶最大数*/
        Integer topNum =  trainingInServiceMapper.selectTopSeq(inService.getType());
        if (inService.getSeq() !=topNum || topNum == 0){
            topNum = topNum+1;
            inService.setSeq(topNum);
            return trainingInServiceMapper.updateById(inService);
        }
        return 0;
    }
}
