package com.training.web.controller.trainingDev;

import com.training.common.annotation.Log;
import com.training.common.core.controller.BaseController;
import com.training.common.core.domain.AjaxResult;
import com.training.common.core.page.TableDataInfo;
import com.training.common.enums.BusinessType;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingShare;
import com.training.system.service.training.ITrainingShareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 培训介绍Controller
 *
 * @author training
 * @date 2023-03-02
 */
@RestController
@RequestMapping("/system/share")
public class TrainingShareController extends BaseController {

    @Autowired
    private ITrainingShareService trainingShareService;

    /**
     * pc查询培训分享列表
     */
    @GetMapping("/list")
    public TableDataInfo list(TrainingShare share) {
        startPage();
        List<TrainingShare>  list = trainingShareService.getShareList(share);
        return getDataTable(list);
    }

    /**
     * 手机查询培训分享列表
     */
    @GetMapping("/query")
    public AjaxResult getInfo(HttpServletRequest request) {
        String year = request.getParameter("year");
        List<TrainingShare> list = trainingShareService.getMShareList(year);

        list.forEach(row->{
            if (row.getImageName()!=null){
                row.setImageSrc(row.getImageName());
            }
        });
        return AjaxResult.success(list);
    }

    /**
     * 新增培训分享
     */
    @PreAuthorize("@ss.hasPermi('system:share:add')")
    @Log(title = "培训介绍", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody TrainingShare share) {
        return toAjax(trainingShareService.addShare(share));
    }

    /**
     * 修改培训分享
     */
    @PreAuthorize("@ss.hasPermi('system:share:edit')")
    @Log(title = "培训介绍", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody TrainingShare share) {
        return toAjax(trainingShareService.updateShare(share));
    }


    /**
     * 批量删除培训分享
     */
    @PreAuthorize("@ss.hasPermi('system:share:remove')")
    @Log(title = "领班课件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(trainingShareService.deleteShares(ids));
    }

    /**
     * 置顶培训分享
     */
    @PostMapping("/topShare")
    public AjaxResult topShare(@RequestBody TrainingShare share) {
        share.setUpdateBy(SecurityUtils.getUsername());
        share.setUpdateTime(new Date());
        return toAjax(trainingShareService.topShare(share));
    }
}
