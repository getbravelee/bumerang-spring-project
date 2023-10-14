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
    private Integer userCareer;
    private String userIntro;
    private String userPortfolioLink;
    private String userContactLink;
    private String userProfileImg;
    private String userRole;

    public User(String userLoginId, String userPassword, String userNickname, String userEmail) {
        System.err.println("디버그 User(String userLoginId, String userPassword, String userNickname, String userEmail)");
        this.userLoginId = userLoginId;
        this.userPassword = userPassword;
        this.userNickname = userNickname;
        this.userEmail = userEmail;
    }
}
