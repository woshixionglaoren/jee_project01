package com.jee.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jee.pojo.User;
import com.jee.pojo.article;
import com.jee.service.IArticleService;
import com.jee.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/13
 **/
@Controller
@RequestMapping("/manage/article/")
public class ArticleManageController {

    @Autowired
    private IArticleService iArticleService;

    @Autowired
    private ICommentService iCommentService;

    @RequestMapping("index.do")
    public ModelAndView index(HttpSession session){
        User adminResult = (User) session.getAttribute("USER_SESSION");
        int articleCount = iArticleService.articleCount();

        int commentCount = iCommentService.commentCount();
        ModelAndView mav=new ModelAndView("admin/index");
        mav.addObject("adminMsg",adminResult);
        mav.addObject("articleCount",articleCount);
        mav.addObject("commentCount",commentCount);
        return mav;
    }

    @RequestMapping("article_list.do")
    public ModelAndView article_list(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                     @RequestParam(value = "pageSize",defaultValue = "10")int pageSize){
        PageHelper.startPage(pageNum, pageSize);

        List<article> articleList = iArticleService.articleList();
        PageInfo<article> articlePageInfo = new PageInfo<article>(articleList);
        ModelAndView mav = new ModelAndView("admin/article_list");
        mav.addObject("page",articlePageInfo);
        mav.addObject("articleList",articleList);
        return mav;
    }

    @RequestMapping("article_detail.do")
    public ModelAndView article_detail(Integer id){
        article articleDetail = iArticleService.articleDetail(id);
        ModelAndView mav = new ModelAndView("admin/article_detail");
        mav.addObject("articleDetail",articleDetail);
        return mav;
    }

    @RequestMapping("article_edit.do")
    public ModelAndView article_edit(Integer id){
        article articleEdit = iArticleService.articleEdit(id);
        ModelAndView mav = new ModelAndView("admin/article_edit");
        mav.addObject("articleEdit",articleEdit);
        return mav;
    }

    @RequestMapping("article_edit_update.do")
    public ModelAndView article_edit_update(article articleEdit){
        ModelAndView modelAndView=new ModelAndView("/admin/article_edit");
        if (iArticleService.articleEditUpdate(articleEdit)){
            modelAndView.addObject("succ", "修改文章成功！");

        }else {
            modelAndView.addObject("error", "修改文章失败！");
        }
        return modelAndView;
    }

//    新建文章页面
    @RequestMapping("article_add.do")
    public ModelAndView article_add(){
        ModelAndView mav = new ModelAndView("admin/article_add");
        return mav;
    }

    @RequestMapping("article_add_do.do")
    public String article_add_do(article articleAdd, RedirectAttributes redirectAttributes){
/*        ModelAndView mav = new ModelAndView("admin/article_add");
        return mav;*/

        if (iArticleService.articleAdd(articleAdd)){
            redirectAttributes.addFlashAttribute("succ", "发表文章成功！");//使用addFlashAttribute,参数不会出现在url地址栏中
            return "redirect:/manage/article/article_add.do";
        }else {
            redirectAttributes.addFlashAttribute("error", "发表文章失败！");
            return "redirect:/manage/article/article_add.do";
        }
    }


    @RequestMapping("article_search.do")
    public ModelAndView article_search(@RequestParam(value = "keyword")String keyword,
                                       @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                       @RequestParam(value = "pageSize",defaultValue = "10")int pageSize){
        PageHelper.startPage(pageNum, pageSize);

        List<article> articleSearchList  = iArticleService.article_search(keyword);
        PageInfo<article> articlePageInfo = new PageInfo<article>(articleSearchList);
        ModelAndView mav = new ModelAndView("admin/article_list");
        mav.addObject("page",articlePageInfo);
        mav.addObject("articleList",articleSearchList);
        return mav;
    }

    @RequestMapping(value = "article_del.do", method = RequestMethod.POST)
    @ResponseBody
    public Object article_del(Integer id){
        int resultDel = iArticleService.article_del(id);
        HashMap<String, String> res = new HashMap<String, String>();
        if (resultDel == 1){
            res.put("stateCode","1");
        }else {
            res.put("stateCode","0");
        }
        return res;
    }
}
