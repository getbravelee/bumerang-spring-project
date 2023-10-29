package com.example.bumerang.web.dto.response.admin;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class UserListDto {
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
    private Timestamp updatedAt;
    private Timestamp createdAt;
}
