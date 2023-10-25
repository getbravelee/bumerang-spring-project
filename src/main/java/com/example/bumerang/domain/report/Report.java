package com.example.bumerang.domain.report;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class Report {
    private Integer reportId;
    private String reportType;
    private String reportContent;
    private String reportStatus;
    private Integer jobId;
    private Integer pfId;
    private Integer commentId;
    private Integer userId;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    @Builder
    public Report(String reportType, String reportContent, Integer jobId, Integer pfId, Integer commentId, Integer userId) {
        this.reportType = reportType;
        this.reportContent = reportContent;
        this.jobId = jobId;
        this.pfId = pfId;
        this.commentId = commentId;
        this.userId = userId;
    }
}