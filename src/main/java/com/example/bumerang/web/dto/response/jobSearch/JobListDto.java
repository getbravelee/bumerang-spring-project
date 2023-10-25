package com.example.bumerang.web.dto.response.jobSearch;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JobListDto {
    private Integer jobId;
    private String jobGenre;
    private String jobDeadline;
    private String jobContentTitle;
    private String userProfileImg;
    private String userNickname;
    private Integer userId;
    private Integer viewCount;
    private Integer commentCount;

}
