package com.jee.service.Impl;

import com.jee.dao.CommentMapper;
import com.jee.pojo.Comment;
import com.jee.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/14
 **/
@Service("iCommentService")
public class CommentServiceImpl implements ICommentService {

    @Autowired
    private CommentMapper commentMapper;

    public int commentCount(){
        return commentMapper.selectCommentCount();
    }

    public List<Comment> commentList(Integer id,Integer offset, Integer limit){
        return commentMapper.selectAllCommentById(id,offset,limit);
    }

    public int comment_add(Comment comment){
        return commentMapper.insert(comment);
    }

    public int comment_del(Integer id){
        return commentMapper.deleteByPrimaryKey(id);
    }

}
