package com.jee.service;

import com.jee.pojo.User;

import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/9
 **/

public interface IUserService {
    User login(String username, String password);
    String register(User user);



    List<User> userList();
    List<User> userSearchList(String keyword);
    int userDel(Integer id);
    int userUpdateRole(Integer id);
}
