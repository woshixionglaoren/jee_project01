package com.jee.controller.admin;

import com.jee.pojo.Comment;
import com.jee.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/15
 **/
@Controller
@RequestMapping("/manage/comment/")
public class CommentManageController {

    @Autowired
    private ICommentService iCommentService;

    @RequestMapping("comment_list.do")
    public ModelAndView comment_list(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        List<Comment> commentList = iCommentService.commentList(id,0,10);
        ModelAndView mav = new ModelAndView("admin/comment_list");
        mav.addObject("commentList",commentList);
        return mav;
    }

    @RequestMapping(value = "comment_del.do",method = RequestMethod.POST)
    @ResponseBody
    public Object comment_del(Integer id){
        int resultDel = iCommentService.comment_del(id);
        HashMap<String,String> res = new HashMap<>();
        if (resultDel > 0){
            res.put("stateCode","1");
        }
        else{
            res.put("stateCode","0");
        }
        return res;
    }
}
