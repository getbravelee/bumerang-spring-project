package com.example.bumerang.domain.user;

import com.example.bumerang.web.dto.ex.request.JoinDto;

import java.util.List;

public interface  UserDao {

    public User findById(Integer userId);

    public List<User> findAll();

    public void insert(User user);

    public void update(User user);

    public void delete(Integer userId);

    public void join(JoinDto joinDto);

    public User findByLoginId(String userLoginId); // 예제

    public void updateUser(JoinDto joinDto); // 예제
}
