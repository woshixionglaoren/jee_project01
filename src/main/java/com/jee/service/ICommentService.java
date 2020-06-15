package com.jee.service;

import com.jee.pojo.Comment;

import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/14
 **/

public interface ICommentService {
    int commentCount();
    List<Comment> commentList(Integer id,Integer offset, Integer limit);
    int comment_add(Comment comment);
    int comment_del(Integer id);
}
