package com.example.bumerang.web.dto.request.user;

import com.example.bumerang.domain.user.User;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateDto {

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
    private Integer userId;

    public User toEntity(){
        return User.builder()

                .userLoginId(this.userLoginId)
                .userPassword(this.userPassword)
                .userEmail(this.userEmail)
                .userNickname(this.userNickname)
                .userAge(this.userAge)
                .userPosition(this.userPosition)
                .userGender(this.userGender)
                .userCareer(this.userCareer)
                .userIntro(this.userIntro)
                .userPortfolioLink(this.userPortfolioLink)
                .userContactLink(this.userContactLink)
                .userProfileImg(this.userProfileImg)
                .userId(this.userId)
                .build();
    }
}
