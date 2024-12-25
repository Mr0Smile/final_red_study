package zjnu.red_study.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import zjnu.red_study.entity.Articles;
import zjnu.red_study.mapper.ArticlesMapper;

import java.util.List;

/**
 * Articles 业务处理
 **/
@Service
public class ArticlesService {

    @Resource
    private ArticlesMapper articlesMapper;

    /**
     * 新增文章
     */
    @Transactional
    public void add(Articles articles) {
        articlesMapper.insert(articles);
    }

    /**
     * 删除文章
     */
    @Transactional
    public void deleteById(Integer id) {
        articlesMapper.deleteById(id);
    }

    /**
     * 更新文章
     */
    @Transactional
    public void updateById(Articles articles) {
        articlesMapper.updateById(articles);
    }

    /**
     * 根据ID查询文章
     */
    public Articles selectById(Integer id) {
        return articlesMapper.selectById(id);
    }

    /**
     * 查询所有文章
     */
    public List<Articles> selectAll(Articles articles) {
        return articlesMapper.selectAll( articles);
    }
    public PageInfo<Articles> selectPage(Articles articles, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Articles> list = articlesMapper.selectAll(articles);
        return PageInfo.of(list);
    }
}