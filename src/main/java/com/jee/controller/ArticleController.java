package com.jee.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jee.pojo.Comment;
import com.jee.pojo.article;
import com.jee.service.IArticleService;
import com.jee.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/10
 **/
@Controller
@RequestMapping("/article/")
public class ArticleController {

    @Autowired
    private IArticleService iArticleService;

    @Autowired
    private ICommentService iCommentService;

    @RequestMapping("blog_index.do")
    public String blog_index(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize",defaultValue = "5")int pageSize,
                             Model model){
        PageHelper.startPage(pageNum, pageSize);
        List<article> articleList = iArticleService.blog_index_list();
        PageInfo<article> resultList = new PageInfo<article>(articleList);
        model.addAttribute("page",resultList);
        model.addAttribute("articleList",articleList);
        return "blog_index";
    }

    @RequestMapping("blog_detail.do")
    public ModelAndView blog_detail(Integer id){

        article resultArticle = iArticleService.blog_detail(id);
        article lastArticle = iArticleService.lastArticle(id);
        article nextArticle = iArticleService.nextArticle(id);

        List<Comment> commentList = iCommentService.commentList(id,0,10);

        ModelAndView mav = new ModelAndView("blog_detail");
        mav.addObject("article",resultArticle);
        mav.addObject("lastArticle",lastArticle);
        mav.addObject("nextArticle",nextArticle);
        mav.addObject("commentList",commentList);
        return mav;
    }

    @RequestMapping("blog_search.do")
    public String blog_search(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                              @RequestParam(value = "pageSize",defaultValue = "5")int pageSize,
                              @RequestParam(value = "keyword",required = false)String keyword,
                             Model model){
        PageHelper.startPage(pageNum, pageSize);

        List<article> articleList = iArticleService.searchByKeyword(keyword);
        PageInfo<article> resultList = new PageInfo<article>(articleList);
        model.addAttribute("page",resultList);
        model.addAttribute("articleList",articleList);
        return "blog_index";
    }

    @RequestMapping("about.do")
    public String about(){
        return "about";
    }


}
