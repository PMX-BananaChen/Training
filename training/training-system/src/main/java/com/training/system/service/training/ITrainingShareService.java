package com.training.system.service.training;

import com.baomidou.mybatisplus.extension.service.IService;
import com.training.system.domain.training.TrainingShare;

import java.util.List;

public interface ITrainingShareService extends IService<TrainingShare> {
    /**
     * pc查询领培训分享列表
     */
    List<TrainingShare> getShareList(TrainingShare share);

    /**
     * 新增培训分享
     */
    boolean addShare(TrainingShare share);

    /**
     * 修改培训分享
     */
    boolean updateShare(TrainingShare share);

    /**
     * 删除除培训分享
     */
    boolean deleteShare(Long id);

    /**
     * 批量删除培训分享
     */
    boolean deleteShares(Long[] ids);

    /**
     * 手机查询领培训分享列表
     */
    List<TrainingShare> getMShareList(String year);

    int topShare(TrainingShare share);
}
