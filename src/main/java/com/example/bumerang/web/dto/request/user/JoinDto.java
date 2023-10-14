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
        User user = new User(this.userLoginId, this.userPassword, this.userNickname, this.userEmail);
        return user;
    }
}
