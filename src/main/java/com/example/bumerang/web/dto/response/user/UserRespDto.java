package com.example.bumerang.web.dto.response.user;

import com.example.bumerang.domain.userPortfolio.UserPortfolio;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class UserRespDto {
    private Integer userId;
    private String userLoginId;
    private String userPassword;
    private String userEmail;
    private String userNickname;
    private String userGender;
    private String userHeight;
    private String userForm;
    private String userTone;
    private String userAge;
    private String userCareer;
    private String userSkill ;
    private String userEducation;
    private String userContactLink;
    private String userProfileImg;
    private String userStatus;
    private String uftitles;
    private List<UserPortfolio> userPortfolio;
}
