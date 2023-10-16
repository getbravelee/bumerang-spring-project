package com.example.bumerang.web.dto.response.jobSearch;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
@Getter
public class JobDetailDto {
    // 구인글 정보
    private Integer jobId;
    private String jobContentTitle;
    private String jobContent;
    private String jobGenre;
    private String jobArtTitle;
    private String jobStartDate;
    private String jobProductionDate;
    private Integer jobTo;
    private String jobField;
    private Boolean jobGender;
    private String jobContact;
    private Integer jobView;
    private String jobDeadline;
    private Timestamp createdAt;
    // 구인글 작성자 정보
    private Integer userId;
    private String userNickname;
    private String userProfileImg;
}
