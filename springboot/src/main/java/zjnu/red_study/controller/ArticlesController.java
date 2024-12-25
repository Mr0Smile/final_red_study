package zjnu.red_study.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import zjnu.red_study.common.Result;
import zjnu.red_study.entity.Articles;
import zjnu.red_study.service.ArticlesService;

import java.util.List;

/**
 * Articles 控制器
 **/
@RestController
@RequestMapping("/articles")

public class ArticlesController {

    private final ArticlesService articlesService;

    public ArticlesController(ArticlesService articlesService) {
        this.articlesService = articlesService;
    }

    /**
     * 新增文章
     */
    @PostMapping("/add")
    public Result add(@RequestBody Articles articles) {
        articlesService.add(articles);
        return Result.success();
    }

    /**
     * 删除文章
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        articlesService.deleteById(id);
        return Result.success();
    }

    /**
     * 修改文章
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Articles articles) {
        try {
            articlesService.updateById(articles);
            return Result.success();
        } catch (Exception e) {
            // 打印异常，或存入日志
            return Result.fail("Update failed: " + e.getMessage());
        }
    }

    /**
     * 获取文章
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Articles articles = articlesService.selectById(id);
        return articles != null ? Result.success(articles) : Result.fail("not found");
    }

    /**
     * 查询所有文章
     */
    @GetMapping("/selectAll")
    public Result selectAll(Articles articles) {
        List<Articles> list = articlesService.selectAll(articles);
        return Result.success(list);
    }
    @GetMapping("/selectPage")
    public Result selectPage(Articles articles, @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Articles> page = articlesService.selectPage(articles, pageNum, pageSize);
        return Result.success(page);
    }
}