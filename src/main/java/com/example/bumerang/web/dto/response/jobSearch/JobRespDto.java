package com.example.bumerang.web.dto.response.jobSearch;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.List;

@Setter
@Getter
public class JobRespDto {
    private Integer jobId;
    private String jobContentTitle;
    private String jobContent;
    private String jobGenre;
    private String jobArtTitle;
    private String jobStartDate;
    private String jobProductionDate;
    private Integer jobTo;
    private String jobPay;
    private String jobGender;
    private String jobContact;
    private String jobDeadline;
    private Integer userId;
    private String jobStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private String jobPositionTitles;
    private List<String> jobPositionTitle;
}
