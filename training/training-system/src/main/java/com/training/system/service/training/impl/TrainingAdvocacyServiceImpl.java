package com.training.system.service.training.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingAdvocacy;
import com.training.system.mapper.training.TrainingAdvocacyMapper;
import com.training.system.service.training.ITrainingAdvocacyService;
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
public class TrainingAdvocacyServiceImpl extends ServiceImpl<TrainingAdvocacyMapper, TrainingAdvocacy> implements ITrainingAdvocacyService {

    @Resource
    private TrainingAdvocacyMapper trainingAdvocacyMapper;

    /**
     * pc查询宣导介绍列表
     */
    @Override
    public List<TrainingAdvocacy> getAdvocacyList(TrainingAdvocacy advocacy) {
        List<TrainingAdvocacy> advocacys = this.list(Wrappers.<TrainingAdvocacy>query().lambda()
                .eq(Optional.ofNullable(advocacy.getType()).isPresent(), TrainingAdvocacy::getType, advocacy.getType())
                .like(Optional.ofNullable(advocacy.getAuthor()).isPresent(),TrainingAdvocacy::getAuthor, advocacy.getAuthor())
                .like(Optional.ofNullable(advocacy.getTitle()).isPresent(),TrainingAdvocacy::getTitle, advocacy.getTitle())
                .orderByDesc(TrainingAdvocacy::getSeq)
                .orderByDesc(TrainingAdvocacy::getCreateTime));
        return advocacys;
    }
    /**
     * 手机查询宣导介绍详情
     */
    @Override
    public List<TrainingAdvocacy> getMAdvocacyList(String type) {

        List<TrainingAdvocacy> advocacys= this.list(Wrappers.<TrainingAdvocacy>query().lambda()
                .eq(TrainingAdvocacy::getType, type)
                .orderByDesc(TrainingAdvocacy::getSeq)
                .orderByDesc(TrainingAdvocacy::getCreateTime));
        return advocacys;
    }

    @Override
    public Boolean addAdvocacy(TrainingAdvocacy advocacy) {
        advocacy.setCreateBy(SecurityUtils.getUsername());
        advocacy.setCreateTime(new Date());
        this.pictures(advocacy);
        boolean save = save(advocacy);
        return save;
    }

    /**
     * 修改宣导介绍
     *
     * @param advocacy
     * @return
     */
    @Override
    public boolean updateAdvocacy(TrainingAdvocacy advocacy) {
        advocacy.setUpdateBy(SecurityUtils.getUsername());
        advocacy.setUpdateTime(new Date());
//        this.pictures(advocacy);
        boolean update = updateById(advocacy);
        return update;
    }
    private void pictures(TrainingAdvocacy advocacy) {
        // 判断是否传入图片
        if (advocacy.getImageNameList().size() > 0) {
            // 多张图片名字用逗号隔开
            String img = advocacy.getImageNameList().stream().map(String::valueOf).collect(Collectors.joining(","));
            advocacy.setImageName(img);
        }
    }

    /**
     * 批量删除宣导介绍
     */
    @Override
    public boolean deleteAdvocacys(Long[] ids) {
        boolean b = removeByIds(Arrays.asList(ids));

        return b;
    }
    /**
     * 删除除宣导介绍
     */
    @Override
    public boolean deleteAdvocacy(Long id) {
        return removeById(id);
    }

    /**
     * 置顶领班课件
     */
    @Override
    public Integer topAdvocacy(TrainingAdvocacy advocacy) {
        /*置顶最大数*/
        Integer topNum =  trainingAdvocacyMapper.selectTopSeq(advocacy.getType());
        if (advocacy.getSeq() !=topNum || topNum == 0){
            topNum = topNum+1;
            advocacy.setSeq(topNum);
            return trainingAdvocacyMapper.updateById(advocacy);
        }
        return 1;
    }

}
