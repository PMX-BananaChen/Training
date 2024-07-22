package com.training.system.service.training;

import com.baomidou.mybatisplus.extension.service.IService;
import com.training.system.domain.training.TrainingSynopsis;
import com.training.system.domain.training.TrainingUploadFile;

import java.util.List;

public interface ITrainingUploadFileService extends IService<TrainingUploadFile> {
    /**
     * pc查询培训文件列表
     */
    List<TrainingUploadFile> getFileList(TrainingUploadFile file);
    /**
     * pc查询培训文件列表
     */
    boolean addFile(TrainingUploadFile file);
    /**
     * pc更新培训文件列表
     */
    boolean updateFile(TrainingUploadFile file);
    /**
     * pc删除培训文件列表
     */
    boolean deleteFiles(Long[] ids);
}
