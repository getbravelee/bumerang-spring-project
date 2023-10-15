package com.example.bumerang.domain.jobSearch;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
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

    @Builder
    public JobSearch(String jobContentTitle, String jobContent, String jobGenre, String jobArtTitle, String jobStartDate, String jobProductionDate, Integer jobTo, String jobField, Boolean jobGender, String jobContact, String jobDeadline, Integer userId) {
        this.jobContentTitle = jobContentTitle;
        this.jobContent = jobContent;
        this.jobGenre = jobGenre;
        this.jobArtTitle = jobArtTitle;
        this.jobStartDate = jobStartDate;
        this.jobProductionDate = jobProductionDate;
        this.jobTo = jobTo;
        this.jobField = jobField;
        this.jobGender = jobGender;
        this.jobContact = jobContact;
        this.jobDeadline = jobDeadline;
        this.userId = userId;
    }
}
