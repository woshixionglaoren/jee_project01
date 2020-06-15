package com.jee.dao;

import com.jee.pojo.article;

import java.util.List;

public interface articleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(article record);

    int insertSelective(article record);

    article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(article record);

    int updateByPrimaryKey(article record);

    List<article> selectAllArticle();

    article selectLastArticle(Integer id);

    article selectNextArticle(Integer id);

    List<article> selectByKeyword(String keyword);

    int selectArticleCount();

}