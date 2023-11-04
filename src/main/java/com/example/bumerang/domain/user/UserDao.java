package com.example.bumerang.domain.user;

import com.example.bumerang.domain.userPortfolio.UserPortfolio;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.user.LoginDto;
import com.example.bumerang.web.dto.request.user.UpdateDto;
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

    public SessionUserDto findByUser(LoginDto loginDto);

    UserRespDto findByDetail(Integer userId);

    SearchPwDto findToPw(SearchPwDto searchPwDto);

    SearchIdDto findToLoginId(SearchIdDto searchIdDto);
    List<UserJobSearchDto> myJSList(Integer userId);

    List<UserPerformanceDto> myPfList(Integer userId);

    List<UserPortfolio> findByPortfolioList(Integer userId);

    void updateUser(UpdateDto updateDto);

    void fieldDelete(Integer userId);

    void fieldInsert(String ufTitle, Integer userId);

    void portfolioDelete(Integer userId);

    void portfolioInsert(UserPortfolio userPortfolio);

    User findByLoginId(String userLoginId);

    User findByNickname(String userNickname);

    User findByEmail(String userEmail);
}
