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
    private String jobPay;
    private String jobGender;
    private String jobContact;
    private String jobDeadline;
    private Integer userId;
    private String jobStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    @Builder
    public JobSearch(String jobContentTitle, String jobContent, String jobGenre, String jobArtTitle, String jobStartDate, String jobProductionDate, Integer jobTo, String jobPay,  String jobGender, String jobContact, String jobDeadline, Integer jobId, Integer userId) {
        this.jobContentTitle = jobContentTitle;
        this.jobContent = jobContent;
        this.jobGenre = jobGenre;
        this.jobArtTitle = jobArtTitle;
        this.jobStartDate = jobStartDate;
        this.jobProductionDate = jobProductionDate;
        this.jobTo = jobTo;
        this.jobGender = jobGender;
        this.jobContact = jobContact;
        this.jobDeadline = jobDeadline;
        this.jobPay = jobPay;
        this.jobId = jobId;
        this.userId = userId;
    }
}
