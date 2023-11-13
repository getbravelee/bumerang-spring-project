package com.example.bumerang.web.dto.request.user;

import com.example.bumerang.domain.userPortfolio.UserPortfolio;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class UpdateDto {
    private Integer userId;
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
    private String uftitle;
    private List<UserPortfolio> userPortfolio;
}
