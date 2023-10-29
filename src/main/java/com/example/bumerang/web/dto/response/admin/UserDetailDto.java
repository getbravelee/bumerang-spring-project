package com.example.bumerang.web.dto.response.admin;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;
@NoArgsConstructor
@Setter
@Getter
public class UserDetailDto {
    private Integer userId;
    private String userLoginId;
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
}
