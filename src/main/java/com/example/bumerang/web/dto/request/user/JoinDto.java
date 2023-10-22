package com.example.bumerang.web.dto.request.user;

import com.example.bumerang.domain.user.User;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class JoinDto {
    private String userLoginId;
    private String userPassword;
    private String userNickname;
    private String userEmail;

    public User toEntity() {
        return User.builder()
                .userLoginId(this.userLoginId)
                .userPassword(this.userPassword)
                .userEmail(this.userEmail)
                .userNickname(this.userNickname)
                .build();
    }

    public LoginDto toLoginDto() {
        LoginDto loginDto = new LoginDto();
        loginDto.setUserLoginId(this.userLoginId);
        loginDto.setUserPassword(this.userPassword);
        return loginDto;
    }
}

