package com.training.system.service.training;

import com.baomidou.mybatisplus.extension.service.IService;
import com.training.system.domain.training.TrainingPeriodical;

import java.util.List;

public interface ITrainingPeriodicalService extends IService<TrainingPeriodical> {
    List<TrainingPeriodical> getMPeriodicalList(String type);
    /**
     * pc查询领文章介绍列表
     */
    List<TrainingPeriodical> getPeriodicalList(TrainingPeriodical periodical);

    Boolean addPeriodical(TrainingPeriodical periodical);

    /**
     * 修改文章介绍
     * @param periodical
     * @return
     */
    boolean updatePeriodical(TrainingPeriodical periodical);

    /**
     * 批量删除文章介绍
     */
    boolean deletePeriodicals(Long[] ids);
    /**
     * 删除除文章介绍
     */
    boolean deletePeriodical(Long id);

    int topPeriodical(TrainingPeriodical periodical);
}
