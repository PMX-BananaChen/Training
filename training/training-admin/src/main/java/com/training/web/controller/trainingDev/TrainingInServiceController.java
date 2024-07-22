package com.training.web.controller.trainingDev;

import com.training.common.annotation.Log;
import com.training.common.core.controller.BaseController;
import com.training.common.core.domain.AjaxResult;
import com.training.common.core.page.TableDataInfo;
import com.training.common.enums.BusinessType;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingInService;
import com.training.system.service.training.ITrainingInServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 在职进修Controller
 *
 * @author training
 * @date 2023-03-02
 */
@RestController
@RequestMapping("/system/inService")
public class TrainingInServiceController extends BaseController {

    @Autowired
    private ITrainingInServiceService trainingInServiceService;

    /**
     * pc查询领在职进修列表
     */
    @GetMapping("/list")
    public TableDataInfo list(TrainingInService inService) {
        startPage();
        List<TrainingInService> list = trainingInServiceService.getInServiceList(inService);
        return getDataTable(list);
    }

    /**
     * 手机查询领在职进修列表
     */
    @GetMapping("/query")
    public AjaxResult getInfo(HttpServletRequest request) {
        String type = request.getParameter("type");
        List<TrainingInService> list = trainingInServiceService.getMInServiceList(type);

        list.forEach(row->{
            if (row.getImageName()!=null){
                row.setImageSrc(row.getImageName());
            }
        });
        return AjaxResult.success(list);
    }

    /**
     * 新增在职进修
     */
    @PreAuthorize("@ss.hasPermi('system:inService:add')")
    @Log(title = "在职进修", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody TrainingInService inService) {
        inService.setCreateBy(SecurityUtils.getUsername());
        inService.setCreateTime(new Date());
        this.pictures(inService);
        return toAjax(trainingInServiceService.save(inService));
    }

    /**
     * 修改在职进修
     */
    @PreAuthorize("@ss.hasPermi('system:inService:edit')")
    @Log(title = "在职进修", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody TrainingInService inService) {
        return toAjax(trainingInServiceService.updateInService(inService));
    }

    /**
     * 批量删除在职进修
     */
    @PreAuthorize("@ss.hasPermi('system:inService:remove')")
    @Log(title = "领班课件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(trainingInServiceService.deleteInServices(ids));
    }

    private void pictures(TrainingInService inService) {
        // 判断是否传入图片
        if (inService.getImageNameList().size() > 0) {
            // 多张图片名字用逗号隔开
            String img = inService.getImageNameList().stream().map(String::valueOf).collect(Collectors.joining(","));
            inService.setImageName(img);
        }
    }

    /**
     * 置顶在职进修
     */
    @PostMapping("/topInService")
    public AjaxResult topInService(@RequestBody TrainingInService inService) {
        inService.setUpdateBy(SecurityUtils.getUsername());
        inService.setUpdateTime(new Date());
        return toAjax(trainingInServiceService.topInService(inService));
    }
}
