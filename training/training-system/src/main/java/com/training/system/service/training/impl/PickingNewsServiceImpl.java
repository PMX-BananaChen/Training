package com.training.system.service.training.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.PickingNews;
import com.training.system.mapper.training.PickingNewsMapper;
import com.training.system.service.training.IPickingNewsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * 东聚采风Service业务层处理
 *
 * @author ruoyi
 * @date 2023-03-02
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class PickingNewsServiceImpl extends ServiceImpl<PickingNewsMapper, PickingNews> implements IPickingNewsService {

    @Resource
    private PickingNewsMapper pickingNewsMapper;

    /**
     * 查询东聚采风
     *
     * @param   layoutType
     * @return 东聚采风
     */
    @Override
    public List<PickingNews> selectPickingNewsById(
                                                   @Param("layoutType") String layoutType) {
        return pickingNewsMapper.selectPickingNewsById(layoutType);
    }

    /**
     * 查询东聚采风列表
     *
     * @param pickingNews 东聚采风
     * @return 东聚采风
     */
    @Override
    public List<PickingNews> selectPickingNewsList(PickingNews pickingNews) {
        List<PickingNews> pickingNewsList = this.list(Wrappers.<PickingNews>query().lambda()
                .eq(Optional.ofNullable(pickingNews.getLayoutType()).isPresent(), PickingNews::getLayoutType, pickingNews.getLayoutType())
                .like(Optional.ofNullable(pickingNews.getAuthor()).isPresent(),PickingNews::getAuthor, pickingNews.getAuthor())
                .like(Optional.ofNullable(pickingNews.getLayoutTitle()).isPresent(),PickingNews::getLayoutTitle, pickingNews.getLayoutTitle())
                .orderByDesc(PickingNews::getSeq)
                .orderByDesc(PickingNews::getCreateTime));
        return pickingNewsList;
    }

    /**
     * 新增东聚采风
     *
     * @param pickingNews 东聚采风
     * @return 结果
     */
    @Override
    public int insertPickingNews(PickingNews pickingNews) {
        return pickingNewsMapper.insertPickingNews(pickingNews);
    }

    /**
     * 修改东聚采风
     *
     * @param pickingNews 东聚采风
     * @return 结果
     */
    @Override
    public boolean updatePickingNews(PickingNews pickingNews) {
        pickingNews.setUpdateBy(SecurityUtils.getUsername());
//        pickingNews.setUpdateTime(new Date());
//        return updateById(pickingNews);
        return pickingNewsMapper.updatePickingNews(pickingNews);
    }

    /**
     * 批量删除东聚采风
     *
     * @param newsIds 需要删除的东聚采风ID
     * @return 结果
     */
    @Override
    public int deletePickingNewsByIds(@Param("newsIds") Long[] newsIds) {
        return pickingNewsMapper.deletePickingNewsByIds(newsIds);
    }

    /**
     * 删除东聚采风信息
     *
     * @param newsId 东聚采风ID
     * @return 结果
     */
    @Override
    public int deletePickingNewsById(Long newsId) {
        return pickingNewsMapper.deletePickingNewsById(newsId);
    }

    /**
     * 期数列表
     *
     * @param
     * @return 结果
     */
    @Override
    public List<Map> getPeriods() {
        return pickingNewsMapper.getPeriods();
    }

    @Override
    public List<String> searchOps(String searchType) {
        return pickingNewsMapper.searchOps(searchType);
    }

    /**
     * 手机查询领班课件
     * @param layoutType
     * @return
     */
    @Override
    public List<PickingNews> getMPickingNews(String layoutType) {
        List<PickingNews> pickingNewsList= this.list(Wrappers.<PickingNews>query().lambda()
                .eq(PickingNews::getLayoutType, layoutType)
                .orderByDesc(PickingNews::getSeq)
                .orderByDesc(PickingNews::getCreateTime));
        return pickingNewsList;
    }

    /**
     * 置顶领班课件
     *
     * @param pickingNews
     */
    @Override
    public boolean topMPickingNews(PickingNews pickingNews) {
        /*置顶最大数*/
        Integer topNum =  pickingNewsMapper.selectTopSeq(pickingNews.getLayoutType());
        if (pickingNews.getSeq() !=topNum || topNum == 0){
            topNum = topNum+1;
            pickingNews.setSeq(topNum);
            return pickingNewsMapper.updatePickingNews(pickingNews);
        }
        return true;
    }
}
