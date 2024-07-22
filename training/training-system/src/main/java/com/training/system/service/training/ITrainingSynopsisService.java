package com.training.system.service.training;

import com.baomidou.mybatisplus.extension.service.IService;
import com.training.system.domain.training.TrainingSynopsis;
import com.training.system.domain.training.TrainingSynopsis;

import java.util.List;

public interface ITrainingSynopsisService extends IService<TrainingSynopsis> {
    /**
     * pc查询领培训封面列表
     */
    List<TrainingSynopsis> getSynopsisList(TrainingSynopsis synopsis);

    /**
     * pc查询领培训封面
     */
    TrainingSynopsis getSynopsis(TrainingSynopsis synopsis);

    /**
     * 新增培训封面
     */
    boolean addSynopsis(TrainingSynopsis synopsis);

    /**
     * 修改培训封面
     */
    boolean updateSynopsis(TrainingSynopsis synopsis);

    /**
     * 删除除培训封面
     */
    boolean deleteSynopsis(Long id);

    /**
     * 批量删除培训封面
     */
    boolean deleteSynopsiss(Long[] ids);

    /**
     * 手机查询领培训封面列表
     */
    List<TrainingSynopsis> getMSynopsisList(String year);
}
