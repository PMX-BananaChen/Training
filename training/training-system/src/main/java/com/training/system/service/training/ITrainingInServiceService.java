package com.training.system.service.training;

import com.baomidou.mybatisplus.extension.service.IService;
import com.training.system.domain.training.TrainingInService;

import java.util.List;

public interface ITrainingInServiceService extends IService<TrainingInService> {
    List<TrainingInService> getInServiceList(TrainingInService inService);

    List<TrainingInService> getMInServiceList(String type);

    boolean updateInService(TrainingInService inService);

    boolean deleteInServices(Long[] ids);

    int topInService(TrainingInService inService);
}
