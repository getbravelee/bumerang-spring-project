package com.example.bumerang.web.dto;

import lombok.Getter;

@Getter
public class SessionUserDto { // 세션에 들어갈 사용자 정보
    private Integer userId;
    private String userLoginId;
    private String userRole;
    private String userNickname;
    private String userProfileImg;
}

// 로그인 정보 header 구분할 때 session으로 구분