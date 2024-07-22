package com.training.system.service.training;

import com.baomidou.mybatisplus.extension.service.IService;
import com.training.system.domain.training.TrainingAdvocacy;

import java.util.List;

public interface ITrainingAdvocacyService extends IService<TrainingAdvocacy> {
    List<TrainingAdvocacy> getMAdvocacyList(String type);
    /**
     * pc查询领培训介绍列表
     */
    List<TrainingAdvocacy> getAdvocacyList(TrainingAdvocacy advocacy);

    Boolean addAdvocacy(TrainingAdvocacy advocacy);

    /**
     * 修改培训介绍
     * @param advocacy
     * @return
     */
    boolean updateAdvocacy(TrainingAdvocacy advocacy);

    /**
     * 批量删除培训介绍
     */
    boolean deleteAdvocacys(Long[] ids);
    /**
     * 删除除培训介绍
     */
    boolean deleteAdvocacy(Long id);

    /**
     * 置顶领班课件
     */
    Integer topAdvocacy(TrainingAdvocacy advocacy);
}
