package com.training.web.controller.trainingDev;

import com.training.common.annotation.Log;
import com.training.common.core.controller.BaseController;
import com.training.common.core.domain.AjaxResult;
import com.training.common.core.page.TableDataInfo;
import com.training.common.enums.BusinessType;
import com.training.common.utils.SecurityUtils;
import com.training.system.domain.training.TrainingAdvocacy;
import com.training.system.service.training.ITrainingAdvocacyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 宣导介绍Controller
 *
 * @author training
 * @date 2023-03-02
 */
@RestController
@RequestMapping("/system/advocacy")
public class TrainingAdvocacyController extends BaseController {

    @Autowired
    private ITrainingAdvocacyService trainingAdvocacyService;

    /**
     * pc查询领宣导介绍列表
     */
    @GetMapping("/list")
    public TableDataInfo list(TrainingAdvocacy advocacy) {
        startPage();
        List<TrainingAdvocacy> list = trainingAdvocacyService.getAdvocacyList(advocacy);
        return getDataTable(list);
    }

    /**
     * 手机查询领宣导介绍列表
     */
    @GetMapping("/query")
    public AjaxResult getInfo(HttpServletRequest request) {
        String type = request.getParameter("type");
        List<TrainingAdvocacy> list = trainingAdvocacyService.getMAdvocacyList(type);

        list.forEach(row->{
            if (row.getImageName()!=null){
                row.setImageSrc(row.getImageName());
            }
        });
        return AjaxResult.success(list);
    }

    /**
     * 新增宣导介绍
     */
    @PreAuthorize("@ss.hasPermi('system:advocacy:add')")
    @Log(title = "宣导介绍", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody TrainingAdvocacy advocacy) {
        advocacy.setCreateBy(SecurityUtils.getUsername());
        advocacy.setCreateTime(new Date());
//        this.pictures(advocacy);
        return toAjax(trainingAdvocacyService.save(advocacy));
    }

    /**
     * 修改宣导介绍
     */
    @PreAuthorize("@ss.hasPermi('system:advocacy:edit')")
    @Log(title = "宣导介绍", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody TrainingAdvocacy advocacy) {
        return toAjax(trainingAdvocacyService.updateAdvocacy(advocacy));
    }

    /**
     * 批量删除宣导介绍
     */
//    @PreAuthorize("@ss.hasPermi('system:advocacy:remove')")
    @Log(title = "领班课件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(trainingAdvocacyService.deleteAdvocacys(ids));
    }

    private void pictures(TrainingAdvocacy advocacy) {
        // 判断是否传入图片
        if (advocacy.getImageNameList().size() > 0) {
            // 多张图片名字用逗号隔开
            String img = advocacy.getImageNameList().stream().map(String::valueOf).collect(Collectors.joining(","));
            advocacy.setImageName(img);
        }
    }

    /**
     * 置顶宣导介绍
     */
    @PreAuthorize("@ss.hasPermi('system:advocacy:topAdvocacy')")
    @PostMapping("/topAdvocacy")
    public AjaxResult topAdvocacy(@RequestBody TrainingAdvocacy advocacy) {
        advocacy.setUpdateBy(SecurityUtils.getUsername());
        advocacy.setUpdateTime(new Date());
        return toAjax(trainingAdvocacyService.topAdvocacy(advocacy));
    }
}
