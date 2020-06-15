package com.jee.service;

import com.jee.pojo.article;

import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/11
 **/

public interface IArticleService {
    List<article> blog_index_list();
    article blog_detail(Integer id);
    article lastArticle(Integer id);
    article nextArticle(Integer id);
    List<article> searchByKeyword(String keyword);



    int articleCount();
    List<article> articleList();
    article articleDetail(Integer id);
    article articleEdit(Integer id);
    boolean articleEditUpdate(article articleEdit);
    boolean articleAdd(article articleAdd);
    List<article> article_search(String keyword);
    int article_del(Integer id);
}
