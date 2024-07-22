package com.training.system.service.training.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingIntroduce;
import com.training.system.mapper.training.TrainingIntroduceMapper;
import com.training.system.service.training.ITrainingIntroduceService;
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
public class TrainingIntroduceServiceImpl extends ServiceImpl<TrainingIntroduceMapper, TrainingIntroduce> implements ITrainingIntroduceService {

    @Resource
    private TrainingIntroduceMapper trainingIntroduceMapper;

    /**
     * pc查询领培训介绍列表
     */
    @Override
    public List<TrainingIntroduce> getIntroduceList(TrainingIntroduce introduce) {
        List<TrainingIntroduce> introduces = this.list(Wrappers.<TrainingIntroduce>query().lambda()
                .eq(Optional.ofNullable(introduce.getType()).isPresent(), TrainingIntroduce::getType, introduce.getType())
                .like(Optional.ofNullable(introduce.getAuthor()).isPresent(),TrainingIntroduce::getAuthor, introduce.getAuthor())
                .like(Optional.ofNullable(introduce.getTitle()).isPresent(),TrainingIntroduce::getTitle, introduce.getTitle())
                .orderByDesc(TrainingIntroduce::getSeq)
                .orderByDesc(TrainingIntroduce::getCreateTime));
        return introduces;
    }
    /**
     * 手机查询领培训介绍详情
     */
    @Override
    public List<TrainingIntroduce> getMIntroduceList(String type) {

        List<TrainingIntroduce> introduces= this.list(Wrappers.<TrainingIntroduce>query().lambda()
                .eq(TrainingIntroduce::getType, type)
                .orderByDesc(TrainingIntroduce::getSeq)
                .orderByDesc(TrainingIntroduce::getCreateTime));
        return introduces;
    }

    @Override
    public Boolean addIntroduce(TrainingIntroduce introduce) {
        introduce.setCreateBy(SecurityUtils.getUsername());
        introduce.setCreateTime(new Date());
        this.pictures(introduce);
        boolean save = save(introduce);
        return save;
    }

    /**
     * 修改培训介绍
     *
     * @param introduce
     * @return
     */
    @Override
    public boolean updateIntroduce(TrainingIntroduce introduce) {
        introduce.setUpdateBy(SecurityUtils.getUsername());
        introduce.setUpdateTime(new Date());
//        this.pictures(introduce);
        boolean update = updateById(introduce);
        return update;
    }
    private void pictures(TrainingIntroduce introduce) {
        // 判断是否传入图片
        if (introduce.getImageNameList().size() > 0) {
            // 多张图片名字用逗号隔开
            String img = introduce.getImageNameList().stream().map(String::valueOf).collect(Collectors.joining(","));
            introduce.setImageName(img);
        }
    }

    /**
     * 批量删除培训介绍
     */
    @Override
    public boolean deleteIntroduces(Long[] ids) {
        boolean b = removeByIds(Arrays.asList(ids));
        return b;
    }
    /**
     * 删除除培训介绍
     */
    @Override
    public boolean deleteIntroduce(Long id) {
        return removeById(id);
    }

    @Override
    public int topIntroduce(TrainingIntroduce introduce) {
        /*置顶最大数*/
        Integer topNum =  trainingIntroduceMapper.selectTopSeq(introduce.getType());
        if (introduce.getSeq() !=topNum || topNum == 0){
            topNum = topNum+1;
            introduce.setSeq(topNum);
            return trainingIntroduceMapper.updateById(introduce);
        }
        return 0;
    }

}
