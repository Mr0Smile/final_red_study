package zjnu.red_study.mapper;

import zjnu.red_study.entity.Articles;

import java.util.List;

/**
 * 操作 articles 相关数据接口
 */
public interface ArticlesMapper {

    /**
     * 新增文章
     */
    int insert(Articles articles);

    /**
     * 删除文章
     */
    int deleteById(Integer id);

    /**
     * 更新文章
     */
    int updateById(Articles articles);

    /**
     * 根据ID查询文章
     */
    Articles selectById(Integer id);

    /**
     * 查询所有文章
     */
    List<Articles> selectAll(Articles articles);
}