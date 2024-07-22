package com.training.web.controller.trainingDev;

import com.training.common.annotation.Log;
import com.training.common.core.controller.BaseController;
import com.training.common.core.domain.AjaxResult;
import com.training.common.core.page.TableDataInfo;
import com.training.common.enums.BusinessType;
import com.training.system.domain.training.TrainingUploadFile;
import com.training.system.service.training.ITrainingUploadFileService;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

/**
 * 培训pdf文件上传
 *
 * @author training
 * @date 2023-03-1
 */
@RestController
@RequestMapping("/system/pdfFile")
public class TrainingUploadFileController extends BaseController {
    @Autowired
    private ITrainingUploadFileService trainingUploadFileService;

    /**
     * 培训封面设置列表查询
     */
    @GetMapping("/list")
    public TableDataInfo list(TrainingUploadFile file) {
        startPage();
        List<TrainingUploadFile> list = trainingUploadFileService.getFileList(file);
        return getDataTable(list);
    }

    /**
     * 上传图片到服务器并返回url和文件名
     * 可支持多图片
     *
     * @param file
     * @param request
     * @return result
     */
//    @PreAuthorize("@ss.hasPermi('system:NEWS:upload')")
    @PostMapping("/upload")
    @ResponseBody
    public AjaxResult upload(@RequestParam(value = "file") MultipartFile[] file,
                             HttpServletRequest request) {
        String basePath = request.getScheme() + "://" + request.getServerName(); //获取项目路径+端口号 比如：http://localhost:8080/
        //存入数据库的文件地址集合
        List<Object> pathList = new ArrayList<>();
        try {
            String filename = "";
            //获取源文件
            //存储地址
            for (MultipartFile multipartFile : file) {
                filename = multipartFile.getOriginalFilename(); // 获取文件名
                String[] names = filename.split("\\.");//获取后缀格式
                File targetFile = new File("D://Stan.Zheng/JAVA_Project/imgUpLoad/TrainingPDF/", filename);//目标文件
                if (!targetFile.getParentFile().exists()) {
                    targetFile.getParentFile().mkdirs();
                }
                //传文件一步到位
                multipartFile.transferTo(targetFile);
                Map<String, String> map = new HashMap<>();
                map.put("fileSrc", basePath  +"/TrainingPDF/"+ filename);
                map.put("fileName", filename);
                pathList.add(map);
            }
        } catch (Exception e) {
            return AjaxResult.error("上传失败");
        }
        return AjaxResult.success(pathList);
    }

    /**
     * 新增培训分享
     */
//    @PreAuthorize("@ss.hasPermi('system:file:add')")
    @Log(title = "培训介绍", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody TrainingUploadFile file) {
        return toAjax(trainingUploadFileService.addFile(file));
    }

    /**
     * 修改培训分享
     */
//    @PreAuthorize("@ss.hasPermi('system:file:edit')")
    @Log(title = "培训介绍", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody TrainingUploadFile file) {
        return toAjax(trainingUploadFileService.updateFile(file));
    }


    /**
     * 批量删除培训分享
     */
//    @PreAuthorize("@ss.hasPermi('system:file:remove')")
    @Log(title = "领班课件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(trainingUploadFileService.deleteFiles(ids));
    }

}
