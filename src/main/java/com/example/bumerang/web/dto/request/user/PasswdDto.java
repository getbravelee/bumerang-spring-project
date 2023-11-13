package com.example.bumerang.web.dto.request.user;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PasswdDto {
    private Integer userId;
    private String userLoginId;
    private String userPassword;

}
