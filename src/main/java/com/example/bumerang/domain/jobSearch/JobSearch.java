package com.example.bumerang.domain.jobSearch;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class JobSearch {
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
    private Integer userId;
    private Timestamp createdAt;
}
