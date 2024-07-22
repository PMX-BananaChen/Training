package com.training.web.controller.trainingDev;

import com.training.common.annotation.Log;
import com.training.common.core.controller.BaseController;
import com.training.common.core.domain.AjaxResult;
import com.training.common.core.page.TableDataInfo;
import com.training.common.enums.BusinessType;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingPeriodical;
import com.training.system.service.training.ITrainingPeriodicalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 文章介绍Controller
 *
 * @author training
 * @date 2023-03-02
 */
@RestController
@RequestMapping("/system/periodical")
public class TrainingPeriodicalController extends BaseController {
    @Autowired
    private ITrainingPeriodicalService trainingPeriodicalService;

    /**
     * pc查询领文章介绍列表
     */
    @GetMapping("/list")
    public TableDataInfo list(TrainingPeriodical periodical) {
        startPage();
        List<TrainingPeriodical> list = trainingPeriodicalService.getPeriodicalList(periodical);
        return getDataTable(list);
    }

    /**
     * 手机查询领文章介绍列表
     */
    @GetMapping("/query")
    public AjaxResult getInfo(HttpServletRequest request) {
        String type = request.getParameter("type");
        List<TrainingPeriodical> list = trainingPeriodicalService.getMPeriodicalList(type);

        list.forEach(row->{
            if (row.getImageName()!=null){
                row.setImageSrc(row.getImageName());
            }
        });
        return AjaxResult.success(list);
    }

    /**
     * 新增文章介绍
     */
    @PreAuthorize("@ss.hasPermi('system:periodical:add')")
    @Log(title = "文章介绍", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody TrainingPeriodical periodical) {
        periodical.setCreateBy(SecurityUtils.getUsername());
        periodical.setCreateTime(new Date());
//        this.pictures(periodical);
        return toAjax(trainingPeriodicalService.save(periodical));
    }

    /**
     * 修改文章介绍
     */
    @PreAuthorize("@ss.hasPermi('system:periodical:edit')")
    @Log(title = "文章介绍", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody TrainingPeriodical periodical) {
        return toAjax(trainingPeriodicalService.updatePeriodical(periodical));
    }

    /**
     * 批量删除文章介绍
     */
    @PreAuthorize("@ss.hasPermi('system:periodical:remove')")
    @Log(title = "领班课件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(trainingPeriodicalService.deletePeriodicals(ids));
    }

    private void pictures(TrainingPeriodical periodical) {
        // 判断是否传入图片
        if (periodical.getImageNameList().size() > 0) {
            // 多张图片名字用逗号隔开
            String img = periodical.getImageNameList().stream().map(String::valueOf).collect(Collectors.joining(","));
            periodical.setImageName(img);
        }
    }

    /**
     * 置顶文章介绍
     */
    @PostMapping("/topPeriodical")
    public AjaxResult topPeriodical(@RequestBody TrainingPeriodical periodical) {
        periodical.setUpdateBy(SecurityUtils.getUsername());
        periodical.setUpdateTime(new Date());
        return toAjax(trainingPeriodicalService.topPeriodical(periodical));
    }
}
