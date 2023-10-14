package com.example.bumerang.domain.user;

import lombok.Getter;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@Getter
public class User {
    private Integer userId;
    private String userLoginId;
    private String userPassword;
    private String userEmail;
    private String userNickname;
    private Boolean userGender;
    private Integer userAge;
    private String userPosition;
    private Integer userCarrer;
    private String userInfo;
    private String userPortfolioLink;
    private String userContactLink;
    private String userProfileImg;
    private String userRole;
}
