package com.training.system.service.training;

import com.baomidou.mybatisplus.extension.service.IService;
import com.training.system.domain.training.PickingNews;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 东聚采风Service接口
 *
 * @author ruoyi
 * @date 2023-03-02
 */
public interface IPickingNewsService extends IService<PickingNews> {
    /**
     * 查询东聚采风
     *
     * @param   layoutType
     * @return 东聚采风
     */
    public List<PickingNews>  selectPickingNewsById(
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
     * 批量删除东聚采风
     *
     * @param newsIds 需要删除的东聚采风ID
     * @return 结果
     */
    public int deletePickingNewsByIds(@Param("newsIds") Long[] newsIds);

    /**
     * 删除东聚采风信息
     *
     * @param newsId 东聚采风ID
     * @return 结果
     */
    public int deletePickingNewsById(Long newsId);

    /**
     * 返回期数列表
     *
     * @param
     * @return 结果
     */
    List<Map> getPeriods();

    List<String> searchOps(@Param("searchType") String searchType);

    /**
     *手机查询领班课件
     * @param layoutType
     * @return
     */
    List<PickingNews> getMPickingNews(String layoutType);

    /**
     * 置顶领班课件
     */
    boolean topMPickingNews(PickingNews pickingNews);
}
