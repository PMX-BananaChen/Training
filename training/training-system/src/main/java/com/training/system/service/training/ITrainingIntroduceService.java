package com.training.system.service.training;

import com.baomidou.mybatisplus.extension.service.IService;
import com.training.system.domain.training.TrainingIntroduce;

import java.util.List;

public interface ITrainingIntroduceService extends IService<TrainingIntroduce> {

    List<TrainingIntroduce> getMIntroduceList(String type);
    /**
     * pc查询领培训介绍列表
     */
    List<TrainingIntroduce> getIntroduceList(TrainingIntroduce introduce);

    Boolean addIntroduce(TrainingIntroduce introduce);

    /**
     * 修改培训介绍
     * @param introduce
     * @return
     */
    boolean updateIntroduce(TrainingIntroduce introduce);

    /**
     * 批量删除培训介绍
     */
    boolean deleteIntroduces(Long[] ids);
    /**
     * 删除除培训介绍
     */
    boolean deleteIntroduce(Long id);

    int topIntroduce(TrainingIntroduce introduce);
}
