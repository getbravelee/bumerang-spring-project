package com.example.bumerang.domain.report;

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
}