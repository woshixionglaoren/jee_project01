package com.jee.dao;

import com.jee.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectLogin(@Param("username")String username,@Param("password")String password);

    int checkUsername(String username);

    List<User> userList();

    List<User> userSearchList(String keyword);
}