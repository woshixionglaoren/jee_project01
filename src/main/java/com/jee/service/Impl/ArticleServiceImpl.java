package com.jee.service.Impl;

import com.jee.dao.articleMapper;
import com.jee.pojo.article;
import com.jee.service.IArticleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/11
 **/
@Service("iArticleService")
public class ArticleServiceImpl implements IArticleService {

    @Autowired
    private articleMapper aMapper;

    public List<article> blog_index_list(){
       return aMapper.selectAllArticle();
    }

    public article blog_detail(Integer id){
        article resultArticle = aMapper.selectByPrimaryKey(id);
        //更新点击量
        Integer clickCount = resultArticle.getArticleCount();
        resultArticle.setArticleCount(clickCount+1);
        resultArticle.setArticleSdtime(resultArticle.getArticleSdtime());
        aMapper.updateByPrimaryKeySelective(resultArticle);
        return resultArticle;
    }

    public article lastArticle(Integer id){
        return aMapper.selectLastArticle(id);
    }

    public article nextArticle(Integer id){
        return aMapper.selectNextArticle(id);
    }

    public List<article> searchByKeyword(String keyword){
        if (StringUtils.isNotBlank(keyword)){//判断关键字
            keyword = new StringBuilder().append("%").append(keyword).append("%").toString();
        }
        List<article> resultList = aMapper.selectByKeyword(keyword);
        return resultList;
    }



//    admin方法

    public int articleCount(){
        return aMapper.selectArticleCount();
    }

    public List<article> articleList(){
       return aMapper.selectAllArticle();
    }

    public article articleDetail(Integer id){
        return aMapper.selectByPrimaryKey(id);
    }

    public article articleEdit(Integer id){
        return aMapper.selectByPrimaryKey(id);
    }

    public boolean articleEditUpdate(article articleEdit){
        return aMapper.updateByPrimaryKeySelective(articleEdit)>0;
    }

    public boolean articleAdd(article articleAdd){
        return aMapper.insert(articleAdd)>0;
    }

    public List<article> article_search(String keyword){
        if (StringUtils.isNotBlank(keyword)){//判断关键字
            keyword = new StringBuilder().append("%").append(keyword).append("%").toString();
        }
        return aMapper.selectByKeyword(keyword);
    }

    public int article_del(Integer id){
        return aMapper.deleteByPrimaryKey(id);
    }

}
