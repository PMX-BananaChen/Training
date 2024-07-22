package com.training.system.domain.training;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.training.common.annotation.Excel;
import com.training.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 东聚采风对象 PICKING_NEWS
 *
 * @author ruoyi
 * @date 2023-03-02
 */
@Data
public class PickingNews extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 新闻主键ID
     */
    private Long newsId;

    /**
     * 版面编号
     */
    @Excel(name = "版面编号")
    private Long layoutNo;

    /**
     * 版面标题
     */
    @Excel(name = "版面标题")
    private String layoutTitle;

    /**
     * 版面日期
     */
    @Excel(name = "版面日期")
    private Long layoutDate;

    /**
     * 作者
     */
    @Excel(name = "作者")
    private String author;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateTime;

    /**
     * 更新人名称
     */
    @Excel(name = "更新人名称")
    private String updateBy;

    /**
     * 创建人
     */
    @Excel(name = "创建人")
    private String createBy;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createTime;

    /**
     * 版面类型(1、资讯；2、文章；3、员工天地；4、缤纷生活；)
     */
    @Excel(name = "版面类型(1、资讯；2、文章；3、员工天地；4、缤纷生活；)")
    private Long layoutType;

    /**
     * 版面年份
     */
    @Excel(name = "版面年份")
    private Long layoutYear;

    /**
     * 内容
     */
    @Excel(name = "内容")
    private String content;

    /**
     * 内容时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "内容时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date contentDate;

    /**
     * 图片名称(多张逗号隔开)
     */
    @Excel(name = "图片名称(多张逗号隔开)")
    private String imageName;

    /**
     * 文章链接
     */
    @Excel(name = "文章链接")
    private String articleUrl;

    /**
     * 图片路径
     */
    @TableField(exist = false)
    private String imageSrc;

    /**
     * 图片名集合
     */
    @TableField(exist = false)
    private List<String> imageNameList;

    /**
     * 开始时间
     */
    @TableField(exist = false)
    private Date startDate;

    /**
     * 结束时间
     */
    @TableField(exist = false)
    private Date endDate;

    /**
     * 排序置顶
     */
    private Integer seq;
}
