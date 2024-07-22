package com.training.web.controller.trainingDev;

import com.training.common.annotation.Log;
import com.training.common.core.controller.BaseController;
import com.training.common.core.domain.AjaxResult;
import com.training.common.core.page.TableDataInfo;
import com.training.common.enums.BusinessType;
import com.training.common.utils.SecurityUtils;
import com.training.common.utils.poi.ExcelUtil;
import com.training.system.domain.training.PickingNews;
import com.training.system.service.training.IPickingNewsService;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 领班课件Controller
 *
 * @author training
 * @date 2023-03-02
 */
@RestController
@RequestMapping("/system/NEWS")
public class ForemanTrainController extends BaseController {

    @Autowired
    private IPickingNewsService pickingNewsService;

    @Value("${training.profile}")
    private String filePath;

    @Value("${spring.redis.host}")
    private String host;

    @Value("${spring.redis.port}")
    private String port;



    /**
     * pc下拉查询
     *
     * @return result
     */
    @GetMapping("/searchOps")
    public AjaxResult searchOps(String searchType) {
        return AjaxResult.success(pickingNewsService.searchOps(searchType));
    }


    /**
     * 查询领班课件列表
     */
//    @PreAuthorize("@ss.hasPermi('system:NEWS:list')")
    @GetMapping("/list")
    public TableDataInfo list(PickingNews pickingNews) {
        startPage();
        List<PickingNews> list = pickingNewsService.selectPickingNewsList(pickingNews);
        return getDataTable(list);
    }

    /**
     * 导出领班课件列表
     */
//    @PreAuthorize("@ss.hasPermi('system:NEWS:export')")
    @Log(title = "领班课件", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(PickingNews pickingNews) {
        List<PickingNews> list = pickingNewsService.selectPickingNewsList(pickingNews);
        ExcelUtil<PickingNews> util = new ExcelUtil<PickingNews>(PickingNews.class);
        return util.exportExcel(list, "NEWS");
    }

    /**
     * 获取领班课件详细信息
     */
//    @PreAuthorize("@ss.hasPermi('system:NEWS:query')")
    @GetMapping(value = "/query")
    public AjaxResult getInfo(HttpServletRequest request) {
        // 版面类型
        String layoutType = request.getParameter("layoutType");

        List<PickingNews> pickingNews = pickingNewsService.getMPickingNews(layoutType);

        pickingNews.forEach(find -> {
            if (null != find.getImageName()) {
                find.setImageSrc(find.getImageName());
            }
        });
        return AjaxResult.success(pickingNews);
    }

    /**
     * 新增领班课件
     */
//    @PreAuthorize("@ss.hasPermi('system:NEWS:add')")
    @Log(title = "领班课件", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody PickingNews pickingNews) {
        pickingNews.setCreateBy(SecurityUtils.getUsername());
//        this.pictures(pickingNews);
        return toAjax(pickingNewsService.insertPickingNews(pickingNews));
    }

    /**
     * 修改领班课件
     */
//    @PreAuthorize("@ss.hasPermi('system:NEWS:edit')")
    @Log(title = "领班课件", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody PickingNews pickingNews) {
        pickingNews.setUpdateBy(SecurityUtils.getUsername());
//        this.pictures(pickingNews);
        return toAjax(pickingNewsService.updatePickingNews(pickingNews));
    }

    private void pictures(PickingNews pickingNews) {
        // 判断是否传入图片
        if (pickingNews.getImageNameList().size() > 0) {
            // 多张图片名字用逗号隔开
            String img = pickingNews.getImageNameList().stream().map(String::valueOf).collect(Collectors.joining(","));
            pickingNews.setImageName(img);
        }
    }

    /**
     * 批量删除领班课件
     */
//    @PreAuthorize("@ss.hasPermi('system:NEWS:remove')")
    @Log(title = "领班课件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{newsIds}")
    public AjaxResult remove(@PathVariable Long[] newsIds) {
        return toAjax(pickingNewsService.deletePickingNewsByIds(newsIds));
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
                String uploadFileName = UUID.randomUUID().toString() + "." + names[names.length - 1];//生成新图片
                File targetFile = new File("D://Stan.Zheng/JAVA_Project/imgUpLoad/", uploadFileName);//目标文件
                if (!targetFile.getParentFile().exists()) {
                    targetFile.getParentFile().mkdirs();
                }

                //传图片一步到位
                multipartFile.transferTo(targetFile);

                // 大于1M图片压缩
                if (targetFile.length() > 1000000) {
                    logger.info("原始大小:" + targetFile.length());
                    //图片尺寸不变，压缩图片文件大小outputQuality实现,参数1为最高质量
                    //压缩为原先大小的20% 压缩时间依图片大小而定 前台最大只能传入10M以内图片
                    Thumbnails.of(targetFile).scale(1f).outputQuality(0.2f).toFile(targetFile);
                    logger.info("压缩大小:" + targetFile.length());
                }
                Map<String, String> map = new HashMap<>();
                map.put("imgSrc", basePath  +"/"+ uploadFileName);
                map.put("fileName", uploadFileName);
                pathList.add(map);
            }
        } catch (Exception e) {
            return AjaxResult.error("上传失败");
        }
        return AjaxResult.success(pathList);
    }

    /**
     * 置顶领班课件
     */
    @PostMapping("/topMPickingNews")
    public AjaxResult topMPickingNews(@RequestBody PickingNews pickingNews) {
        pickingNews.setUpdateBy(SecurityUtils.getUsername());
        pickingNews.setUpdateTime(new Date());
        return toAjax(pickingNewsService.topMPickingNews(pickingNews));
    }
}
