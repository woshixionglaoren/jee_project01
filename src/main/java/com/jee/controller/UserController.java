package com.jee.controller;

import com.jee.pojo.User;
import com.jee.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by 华耀 王 on 2020/6/9
 **/
@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private IUserService iUserService;

    /**
     * 用户登录
     */
    @RequestMapping("login.do")
    public String login(User user, Model model, HttpSession session){
        User resultUser = iUserService.login(user.getUsername(),user.getPassword());
        if (resultUser != null){
            session.setAttribute("USER_SESSION",resultUser);
            return "redirect:/article/blog_index.do";
        }
        model.addAttribute("msg","账号或密码错误，请重新输入！");
        return "login";
    }

    /**
     * 用户注册
     */
    @RequestMapping("register.do")
    public String register(User user,Model model){

        String resultMsg = iUserService.register(user);
        if (resultMsg == "注册成功"){
            model.addAttribute("msg",resultMsg);
            return "registerSuccess";
        }
        model.addAttribute("msg",resultMsg);
        return "register";
    }

    /**
     * 退出登录
     */
    @RequestMapping(value = "logout.do")
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "redirect:login.do";
    }


}
