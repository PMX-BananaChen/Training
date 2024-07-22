package com.training.system.mapper.training;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.training.system.domain.training.TrainingShare;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface TrainingShareMapper extends BaseMapper<TrainingShare> {
    /**
     * 置顶seq最大数
     *
     * @param
     * @param year
     * @return 结果
     */
    @Select("SELECT MAX(seq) FROM training_share where year =#{year}")
    Integer selectTopSeq(Integer year);
}
