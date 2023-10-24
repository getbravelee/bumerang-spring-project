package com.example.bumerang.domain.user;

import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.ex.request.JoinDto;
import com.example.bumerang.web.dto.request.user.LoginDto;
import com.example.bumerang.web.dto.response.user.DetailFormDto;

import java.util.List;

public interface  UserDao {

    public User findById(Integer userId);
    public List<User> findAll();
    public void insert(User user);

    public void update(User user);

    public void delete(Integer userId);

    public void join(JoinDto joinDto);

    public SessionUserDto findByUser(LoginDto loginDto);

}
