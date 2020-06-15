package com.jee.service.Impl;

import com.jee.dao.UserMapper;
import com.jee.pojo.User;
import com.jee.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华耀 王 on 2020/6/9
 **/
@Service("iUserService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    public User login(String username,String password){
        return this.userMapper.selectLogin(username, password);
    }

    public String register(User user){
        if (StringUtils.isNotBlank(user.getUsername())) {
            Boolean checkUsername = this.checkVaild(user.getUsername());
            if (checkUsername == true) {
                int resultCount = userMapper.insert(user);
                if (resultCount == 1) {
                    return "注册成功";
                }
            }
            return "用户名已存在";
        }
        return "请检查输入数据";
    }

    public boolean checkVaild(String str){
        int resultCount = userMapper.checkUsername(str);
        if (resultCount > 0){
            return false;
        }
        return true;
    }


//    用户管理
    public List<User> userList(){
        return userMapper.userList();
    }

    public List<User> userSearchList(String keyword){
        return userMapper.userSearchList(keyword);
    }

    public int userDel(Integer id){
        return userMapper.deleteByPrimaryKey(id);
    }

    public int userUpdateRole(Integer id){
        User user  = new User();
        user.setId(id);
        user.setRole(1);
        return userMapper.updateByPrimaryKeySelective(user);
    }
}
