package com.jee.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jee.pojo.User;
import com.jee.pojo.article;
import com.jee.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/13
 **/
@Controller
@RequestMapping("/manage/user/")
public class UserManageController {

    @Autowired
    private IUserService iUserService;

    /**
     * 管理员用户登录
     */
    @RequestMapping("login.do")
    public String login(User user, Model model, HttpSession session){
//        session.invalidate();
        User resultUser = iUserService.login(user.getUsername(),user.getPassword());
//        if (Integer.valueOf(resultUser.getRole()) == 1 && Integer.valueOf(resultUser.getRole()) != null) {
            if (resultUser != null) {
                if (resultUser.getRole() == 1 && resultUser.getRole() != null) {
                    session.setAttribute("USER_SESSION", resultUser);
                    return "redirect:/manage/article/index.do";
                }
                model.addAttribute("msg","没有管理员权限！");
                return "admin/login";
            }
//        }
        model.addAttribute("msg","请输入正确的用户名和密码！");
        return "admin/login";
    }

    /**
     * 管理员退出登录
     */
    @RequestMapping(value = "logout.do")
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "redirect:/manage/user/login.do";
    }

    /**
     *管理用户
     */
    @RequestMapping("user_list.do")
    public ModelAndView user_list(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                  @RequestParam(value = "pageSize",defaultValue = "10")int pageSize){
        PageHelper.startPage(pageNum, pageSize);
        List<User> userList = iUserService.userList();
        PageInfo<User> userPageInfo = new PageInfo<User>(userList);
        ModelAndView mav = new ModelAndView("admin/user_list");
        mav.addObject("page",userPageInfo);
        mav.addObject("userList",userList);
        return mav;
    }

    @RequestMapping("user_search.do")
    public ModelAndView user_search(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                   @RequestParam(value = "pageSize",defaultValue = "10")int pageSize,
                                    @RequestParam(value = "keyword")String keyword){
        PageHelper.startPage(pageNum, pageSize);
        List<User> userSearchList = iUserService.userSearchList(keyword);
        PageInfo<User> userPageInfo = new PageInfo<User>(userSearchList);
        ModelAndView mav = new ModelAndView("admin/user_list");
        mav.addObject("page",userPageInfo);
        mav.addObject("userList",userSearchList);
        return mav;
    }

    @RequestMapping("user_update_role.do")
    @ResponseBody
    public Object user_update_role(Integer id){
        int userUpdateResult = iUserService.userUpdateRole(id);
        HashMap<String,String> res = new HashMap<>();
        if (userUpdateResult == 1){
            res.put("stateCode","1");
        }else{
            res.put("stateCode","0");
        }
        return res;
    }

    @RequestMapping("user_del.do")
    @ResponseBody
    public Object user_del(Integer id){
        int userDelResult = iUserService.userDel(id);
        HashMap<String,String> res = new HashMap<>();
        if (userDelResult == 1){
            res.put("stateCode","1");
        }else{
            res.put("stateCode","0");
        }
        return res;
    }

}
