package com.training.system.domain.training;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.training.common.core.domain.BaseEntity;
import lombok.Data;

@Data
public class TrainingUploadFile extends BaseEntity {
    private static final long serialVersionUID = 1L;
    @TableId(value = "id" ,type= IdType.AUTO)
    private Integer id;
    private String fileName;
    private String fileUrl;
}
