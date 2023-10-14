package com.example.bumerang.web.dto.ex.request;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class JoinDto {
    private String userLoginId;
    private String userPassword;
    private String userNickname;
    private String userEmail;
}
