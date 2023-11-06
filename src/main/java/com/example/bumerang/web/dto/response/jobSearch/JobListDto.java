package com.example.bumerang.web.dto.response.jobSearch;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JobListDto {
    private Integer jobId;
    private Integer likeyId;
    private String jobGenre;
    private String jobDeadline;
    private String jobContentTitle;
    private List<String> jobPositionTitle;
    private String userProfileImg;
    private String userNickname;
    private String userCareer;
    private Integer userId;
    private Integer viewCount; // 조회수
    private Integer commentCount; // 댓글수
    private Integer likeyCount; // 좋아요수
    private Boolean isDead; // 마감됐는지 확인 여부
    private Boolean isToday; // 오늘 게시글 작성됐는지 확인 여부
}
