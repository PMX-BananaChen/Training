package com.training.system.domain.training;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.training.common.annotation.Excel;
import com.training.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;
import java.util.List;
@Data
public class TrainingAdvocacy extends BaseEntity {
    private static final long serialVersionUID = 1L;
    @TableId(value = "id" ,type= IdType.AUTO)
    private Integer id;
    private String title;
    private String author;
    private String content;
    private String imageName;
    private Integer type;
    private String sourceType;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createTime;
    /**
     * 图片路径
     */
    @TableField(exist = false)
    private String imageSrc;
    /**
     * 文章链接
     */
    @Excel(name = "文章链接")
    private String articleUrl;
    /**
     * 图片名集合
     */
    @TableField(exist = false)
    private List<String> imageNameList;
    /**
     * 排序置顶
     */
    private Integer seq;
}
