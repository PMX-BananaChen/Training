package com.training.web.controller.trainingDev;

import com.training.common.annotation.Log;
import com.training.common.core.controller.BaseController;
import com.training.common.core.domain.AjaxResult;
import com.training.common.core.page.TableDataInfo;
import com.training.common.enums.BusinessType;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingIntroduce;
import com.training.system.service.training.ITrainingIntroduceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 培训介绍Controller
 *
 * @author training
 * @date 2023-03-02
 */
@RestController
@RequestMapping("/system/introduce")
public class TrainingIntroduceController extends BaseController {

    @Autowired
    private ITrainingIntroduceService trainingIntroduceService;

    /**
     * pc查询领培训介绍列表
     */
    @GetMapping("/list")
    public TableDataInfo list(TrainingIntroduce introduce) {
        startPage();
        List<TrainingIntroduce> list = trainingIntroduceService.getIntroduceList(introduce);
        return getDataTable(list);
    }

    /**
     * 手机查询领培训介绍列表
     */
    @GetMapping("/query")
    public AjaxResult getInfo(HttpServletRequest request) {
        String type = request.getParameter("type");
        List<TrainingIntroduce> list = trainingIntroduceService.getMIntroduceList(type);

        list.forEach(row->{
            if (row.getImageName()!=null){
                row.setImageSrc(row.getImageName());
            }
        });
        return AjaxResult.success(list);
    }

    /**
     * 新增培训介绍
     */
    @PreAuthorize("@ss.hasPermi('system:introduce:add')")
    @Log(title = "培训介绍", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody TrainingIntroduce introduce) {
        introduce.setCreateBy(SecurityUtils.getUsername());
        introduce.setCreateTime(new Date());
        this.pictures(introduce);
        return toAjax(trainingIntroduceService.save(introduce));
    }

    /**
     * 修改培训介绍
     */
    @PreAuthorize("@ss.hasPermi('system:introduce:edit')")
    @Log(title = "培训介绍", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody TrainingIntroduce introduce) {
        return toAjax(trainingIntroduceService.updateIntroduce(introduce));
    }

    /**
     * 批量删除培训介绍
     */
    @PreAuthorize("@ss.hasPermi('system:introduce:remove')")
    @Log(title = "领班课件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(trainingIntroduceService.deleteIntroduces(ids));
    }

    private void pictures(TrainingIntroduce introduce) {
        // 判断是否传入图片
        if (introduce.getImageNameList().size() > 0) {
            // 多张图片名字用逗号隔开
            String img = introduce.getImageNameList().stream().map(String::valueOf).collect(Collectors.joining(","));
            introduce.setImageName(img);
        }
    }

    /**
     * 置顶培训介绍
     */
    @PostMapping("/topIntroduce")
    public AjaxResult topIntroduce(@RequestBody TrainingIntroduce introduce) {
        introduce.setUpdateBy(SecurityUtils.getUsername());
        introduce.setUpdateTime(new Date());
        return toAjax(trainingIntroduceService.topIntroduce(introduce));
    }
}
