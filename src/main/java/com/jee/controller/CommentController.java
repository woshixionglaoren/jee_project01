package com.jee.controller;

import com.jee.pojo.Comment;
import com.jee.pojo.User;
import com.jee.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * Created by 华耀 王 on 2020/6/15
 **/
@Controller
@RequestMapping("/comment/")
public class CommentController {

    @Autowired
    private ICommentService iCommentService;

    @RequestMapping(value = "comment_add.do",method = RequestMethod.POST)
    @ResponseBody
    public Object comment_add(Comment comment, HttpSession session){
        User user = (User) session.getAttribute("USER_SESSION");
        comment.setCommentUsername(user.getUsername());
        HashMap<String, String> res = new HashMap<String, String>();
        if(iCommentService.comment_add(comment)>0){
            res.put("stateCode", "1");
        }else {
            res.put("stateCode", "0");
        }
        return res;
    }

}
