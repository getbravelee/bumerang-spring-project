package com.example.bumerang.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchDto {
    private String userEmail;
    private String userLoginId;
    private String userPassword;
}
