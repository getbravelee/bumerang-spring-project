package com.example.bumerang.web.dto.request.user;

import com.example.bumerang.domain.user.User;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class LoginDto {
    private String userLoginId;
    private String userPassword;
}
