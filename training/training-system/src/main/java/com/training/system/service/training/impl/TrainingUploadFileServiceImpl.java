package com.training.system.service.training.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingPeriodical;
import com.training.system.domain.training.TrainingSynopsis;
import com.training.system.domain.training.TrainingUploadFile;
import com.training.system.mapper.training.TrainingUploadFileMapper;
import com.training.system.service.training.ITrainingUploadFileService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@Transactional(rollbackFor = Exception.class)
public class TrainingUploadFileServiceImpl extends ServiceImpl<TrainingUploadFileMapper, TrainingUploadFile> implements ITrainingUploadFileService {
    @Override
    public List<TrainingUploadFile> getFileList(TrainingUploadFile file) {
        List<TrainingUploadFile> files = baseMapper.selectList(
                Wrappers.<TrainingUploadFile>query().lambda()
                        .like(Optional.ofNullable(file.getFileName()).isPresent(), TrainingUploadFile::getFileName, file.getFileName())
                        .orderByDesc(TrainingUploadFile::getCreateTime));
        return files;
    }

    @Override
    public boolean addFile(TrainingUploadFile file) {
        file.setCreateBy(SecurityUtils.getUsername());
        file.setCreateTime(new Date());
        boolean save = save(file);
        return save;
    }

    @Override
    public boolean updateFile(TrainingUploadFile file) {
        file.setUpdateBy(SecurityUtils.getUsername());
        file.setUpdateTime(new Date());
        boolean update = updateById(file);
        return update;
    }

    @Override
    public boolean deleteFiles(Long[] ids) {
        boolean b = removeByIds(Arrays.asList(ids));
        return b;
    }
}
