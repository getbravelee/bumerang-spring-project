package com.example.bumerang.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class LoginDto {
    private String userLoginId;
    private String userPassword;
}
