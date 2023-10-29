package com.example.bumerang.domain.user;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;


@NoArgsConstructor
@Getter
public class User {
    private Integer userId;
    private String userLoginId;
    private String userPassword;
    private String userEmail;
    private String userNickname;
    private String userAge;
    private String userPosition;
    private String userGender;
    private String userCareer;
    private String userIntro;
    private String userPortfolioLink;
    private String userContactLink;
    private String userProfileImg;
    private String userRole;
    private String userStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    @Builder
    public User( Integer userId, String userLoginId, String userPassword, String userEmail, String userNickname, String userAge, String userPosition, String userGender, String userCareer, String userIntro, String userPortfolioLink, String userContactLink, String userProfileImg) {
        this.userId = userId;
        this.userLoginId = userLoginId;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.userNickname = userNickname;
        this.userAge = userAge;
        this.userPosition =userPosition;
        this.userGender = userGender;
        this.userCareer = userCareer;
        this.userIntro = userIntro;
        this.userPortfolioLink = userPortfolioLink;
        this.userContactLink = userContactLink;
        this.userProfileImg = userProfileImg;

    }


}
