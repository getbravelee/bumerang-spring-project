package com.example.bumerang.web.dto.response.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserJobSearchDto {
    private Integer jobId;

    private String jobGenre;
    private String jobDeadline;
    private String jobContentTitle;
    private String userProfileImg;
    private String userCareer;
    private String userNickname;
    private Integer commentCount;
    private Integer viewCount;
    private String createdAt;
}
