package com.training.system.mapper.training;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.training.system.domain.training.TrainingIntroduce;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface TrainingIntroduceMapper extends BaseMapper<TrainingIntroduce> {
    /**
     * 置顶seq最大数
     *
     * @param
     * @param type
     * @return 结果
     */
    @Select("SELECT MAX(seq) FROM training_introduce where type =#{type}")
    Integer selectTopSeq(Integer type);
}
