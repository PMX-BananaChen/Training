package com.training.web.controller.trainingDev;

import com.training.common.annotation.Log;
import com.training.common.core.controller.BaseController;
import com.training.common.core.domain.AjaxResult;
import com.training.common.core.page.TableDataInfo;
import com.training.common.enums.BusinessType;
import com.training.system.domain.training.TrainingSynopsis;
import com.training.system.service.training.ITrainingSynopsisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 培训封面设置
 *
 * @author training
 * @date 2023-02-24
 */
@RestController
@RequestMapping("/system/synopsis")
public class TrainingSynopsisController extends BaseController {

    @Autowired
    private ITrainingSynopsisService trainingSynopsisService;

    /**
     * 培训封面设置列表查询
     */
    @GetMapping("/list")
    public TableDataInfo list(TrainingSynopsis synopsis) {
        startPage();
        List<TrainingSynopsis> list = trainingSynopsisService.getSynopsisList(synopsis);
        return getDataTable(list);
    }

    /**
     * 培训封面设置查询
     */
    @GetMapping("/detail")
    public AjaxResult detail(TrainingSynopsis synopsis) {
        TrainingSynopsis synopsis1 = trainingSynopsisService.getSynopsis(synopsis);
        return AjaxResult.success(synopsis1);
    }

    /**
     * 手机查询培训分享列表
     */
    @GetMapping("/query")
    public AjaxResult getInfo(HttpServletRequest request) {
        String year = request.getParameter("year");
        List<TrainingSynopsis> list = trainingSynopsisService.getMSynopsisList(year);

        list.forEach(row -> {
            if (row.getImageName() != null) {
                row.setImageSrc(row.getImageName());
            }
        });
        return AjaxResult.success(list);
    }

    /**
     * 新增培训分享
     */
//    @PreAuthorize("@ss.hasPermi('system:synopsis:add')")
    @Log(title = "培训介绍", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody TrainingSynopsis synopsis) {
        return toAjax(trainingSynopsisService.addSynopsis(synopsis));
    }

    /**
     * 修改培训分享
     */
//    @PreAuthorize("@ss.hasPermi('system:synopsis:edit')")
    @Log(title = "培训介绍", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody TrainingSynopsis synopsis) {
        return toAjax(trainingSynopsisService.updateSynopsis(synopsis));
    }


    /**
     * 批量删除培训分享
     */
//    @PreAuthorize("@ss.hasPermi('system:synopsis:remove')")
    @Log(title = "领班课件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(trainingSynopsisService.deleteSynopsiss(ids));
    }

}
