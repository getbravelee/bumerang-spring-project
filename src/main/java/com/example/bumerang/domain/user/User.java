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
    private String userRole;
    private String userStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    @Builder
    public User( Integer userId, String userLoginId, String userPassword, String userEmail, String userNickname, String userGender, String userHeight, String userForm, String userTone, String userAge, String userCareer, String userSkill, String userEducation, String userContactLink, String userProfileImg) {
        this.userId = userId;
        this.userLoginId = userLoginId;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.userNickname = userNickname;
        this.userGender = userGender;
        this.userHeight = userHeight;
        this.userForm = userForm;
        this.userTone = userTone;
        this.userAge = userAge;
        this.userCareer =userCareer;
        this.userSkill =userSkill;
        this.userEducation =userEducation;
        this.userContactLink = userContactLink;
        this.userProfileImg = userProfileImg;

    }


}
