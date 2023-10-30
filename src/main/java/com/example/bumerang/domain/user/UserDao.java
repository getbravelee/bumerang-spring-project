package com.example.bumerang.domain.user;

import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.ex.request.JoinDto;
import com.example.bumerang.web.dto.request.user.LoginDto;
import com.example.bumerang.web.dto.response.user.SearchIdDto;
import com.example.bumerang.web.dto.response.user.SearchPwDto;
import com.example.bumerang.web.dto.response.user.UserJobSearchDto;
import com.example.bumerang.web.dto.response.user.UserPerformanceDto;
import com.example.bumerang.web.dto.response.user.UserRespDto;

import java.util.List;

public interface UserDao {

    public User findById(Integer userId);

    public List<User> findAll();

    public void insert(User user);

    public void update(User user);

    public void delete(Integer userId);

    public void join(JoinDto joinDto);

    public SessionUserDto findByUser(LoginDto loginDto);

    UserRespDto findByDetail(Integer userId);

    SearchPwDto findToPw(SearchPwDto searchPwDto);

    SearchIdDto findToLoginId(SearchIdDto searchIdDto);
    List<UserJobSearchDto> myJSList(Integer userId);

    List<UserPerformanceDto> myPfList(Integer userId);

}
