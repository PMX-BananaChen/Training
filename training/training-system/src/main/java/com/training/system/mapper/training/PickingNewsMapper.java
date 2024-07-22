package com.training.system.mapper.training;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.training.system.domain.training.PickingNews;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * 东聚采风Mapper接口
 *
 * @author ruoyi
 * @date 2023-03-02
 */
public interface PickingNewsMapper extends BaseMapper<PickingNews> {
    /**
     * 查询东聚采风
     *
     * @param   layoutType
     * @return 东聚采风
     */
    public List<PickingNews> selectPickingNewsById(
                                                   @Param("layoutType") String layoutType);

    /**
     * 查询东聚采风列表
     *
     * @param pickingNews 东聚采风
     * @return 东聚采风集合
     */
    public List<PickingNews> selectPickingNewsList(PickingNews pickingNews);

    /**
     * 新增东聚采风
     *
     * @param pickingNews 东聚采风
     * @return 结果
     */
    public int insertPickingNews(PickingNews pickingNews);

    /**
     * 修改东聚采风
     *
     * @param pickingNews 东聚采风
     * @return 结果
     */
    public boolean updatePickingNews(PickingNews pickingNews);

    /**
     * 删除东聚采风
     *
     * @param newsId 东聚采风ID
     * @return 结果
     */
    public int deletePickingNewsById(Long newsId);

    /**
     * 批量删除东聚采风
     *
     * @param newsIds 需要删除的数据ID
     * @return 结果
     */
    public int deletePickingNewsByIds(@Param("newsIds") Long[] newsIds);

    /**
     * 期数列表
     *
     * @param
     * @return 结果
     */
    List<Map> getPeriods();

    List<String> searchOps(@Param("searchType") String searchType);

    /**
     * 置顶seq最大数
     *
     * @param
     * @param layoutType
     * @return 结果
     */
    @Select("SELECT MAX(seq) FROM picking_news where layout_type=#{layoutType}")
    Integer selectTopSeq(Long layoutType);
}
