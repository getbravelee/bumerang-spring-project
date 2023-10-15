package com.example.bumerang.domain.user;

import lombok.Builder;
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

    @Builder
    public User(String userLoginId, String userPassword, String userEmail, String userNickname) {
        this.userLoginId = userLoginId;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.userNickname = userNickname;
    }
}
