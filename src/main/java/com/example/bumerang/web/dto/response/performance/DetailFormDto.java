package com.example.bumerang.web.dto.response.performance;

import com.example.bumerang.web.dto.response.jobSearch.JobCommentDto;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.List;

@Setter
@Getter
public class DetailFormDto {
    // 공연글 정보
    private Integer pfId;
    private String pfTitle;
    private String pfContent;
    private String pfAgerating;
    private String pfStartDate;
    private String pfDeadline;
    private String pfBookingmethod;
    private String pfProduction;
    private String pfLocation;
    private Integer pfRunningtime;
    private Integer pfPrice;
    private String pfGenre;
    private String pfThumbnail;
    private String pfStatus;
    private Timestamp createdAt;
    // 공연글 작성자 정보
    private Integer userId;
    private String userNickname;
    private String userProfileImg;
    // 댓글 목록
    private List<PfCommentDto> commentList;
    // 게시글 추천수
    private Integer likeyCount;
    // 게시글 조회수
    private Integer viewCount;
    // 내가 게시글 추천했는지 여부
    private Boolean isLikey;
    private Integer likeyId;
}
