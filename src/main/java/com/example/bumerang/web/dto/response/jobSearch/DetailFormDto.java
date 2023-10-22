package com.example.bumerang.web.dto.response.jobSearch;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.List;

@Setter
@Getter
public class DetailFormDto {
    // 구인글 정보
    private Integer jobId;
    private String jobContentTitle;
    private String jobContent;
    private String jobGenre;
    private String jobArtTitle;
    private String jobStartDate;
    private String jobProductionDate;
    private String jobTo;
    private String jobGender;
    private String jobContact;
    private String jobDeadline;
    private Timestamp createdAt;
    // 구인글 작성자 정보
    private Integer userId;
    private String userNickname;
    private String userProfileImg;
    // 댓글 목록
    private List<JobCommentDto> commentList;
    // 게시글 추천수
    private Integer likeyCount;
    // 게시글 조회수
    private Integer viewCount;
}
