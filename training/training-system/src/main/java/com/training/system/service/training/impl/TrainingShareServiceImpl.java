package com.training.system.service.training.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingShare;
import com.training.system.mapper.training.TrainingShareMapper;
import com.training.system.service.training.ITrainingShareService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional(rollbackFor = Exception.class)
public class TrainingShareServiceImpl extends ServiceImpl<TrainingShareMapper, TrainingShare> implements ITrainingShareService {

    @Resource
    private TrainingShareMapper trainingShareMapper;
    /**
     * 查询领培训分享列表
     */
    @Override
    public List<TrainingShare> getShareList(TrainingShare share) {
        List<TrainingShare> trainingShares = baseMapper.selectList(
                Wrappers.<TrainingShare>query().lambda()
                        .eq(Optional.ofNullable(share.getYear()).isPresent(),TrainingShare::getYear, share.getYear())
                        .like(Optional.ofNullable(share.getAuthor()).isPresent(),TrainingShare::getAuthor, share.getAuthor())
                        .like(Optional.ofNullable(share.getTitle()).isPresent(),TrainingShare::getTitle, share.getTitle())
                        .orderByDesc(TrainingShare::getSeq)
                        .orderByDesc(TrainingShare::getCreateTime));

        return trainingShares;
    }
    /**
     * 手机查询领培训分享列表
     *
     * @param year
     */
    @Override
    public List<TrainingShare> getMShareList(String year) {
        List<TrainingShare> trainingShares = baseMapper.selectList(
                Wrappers.<TrainingShare>query().lambda()
                        .eq(TrainingShare::getYear, year)
                        .orderByDesc(TrainingShare::getSeq)
                        .orderByDesc(TrainingShare::getCreateTime));
        return trainingShares;
    }

    @Override
    public int topShare(TrainingShare share) {
        /*置顶最大数*/
        Integer topNum =  trainingShareMapper.selectTopSeq(share.getYear());
        if (share.getSeq() !=topNum || topNum == 0){
            topNum = topNum+1;
            share.setSeq(topNum);
            return trainingShareMapper.updateById(share);
        }
        return 0;
    }

    @Override
    public boolean addShare(TrainingShare share) {
        share.setCreateBy(SecurityUtils.getUsername());
        share.setCreateTime(new Date());
        this.pictures(share);
        boolean save = save(share);
        return save;
    }

    /**
     * 修改培训分享
     *
     * @param share
     */
    @Override
    public boolean updateShare(TrainingShare share) {
        share.setUpdateBy(SecurityUtils.getUsername());
        share.setUpdateTime(new Date());
//        this.pictures(share);
        boolean update = updateById(share);
        return update;
    }

    private void pictures(TrainingShare share) {
        // 判断是否传入图片
        if (share.getImageNameList().size() > 0) {
            // 多张图片名字用逗号隔开
            String img = share.getImageNameList().stream().map(String::valueOf).collect(Collectors.joining(","));
            share.setImageName(img);
        }
    }

    /**
     * 删除除培训分享
     *
     * @param id
     */
    @Override
    public boolean deleteShare(Long id) {
        return removeById(id);
    }

    /**
     * 批量删除培训分享
     *
     * @param ids
     */
    @Override
    public boolean deleteShares(Long[] ids) {
        boolean b = removeByIds(Arrays.asList(ids));
        return b;
    }
}
