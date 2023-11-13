package com.example.bumerang.web.dto.request.report;

import com.example.bumerang.domain.report.Report;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportDto {
    private Integer reportId;
    private String reportType;
    private String reportContent;
    private Integer jobId;
    private Integer pfId;
    private Integer commentId;
    private Integer userId;
    private String userNickname;
    private String pfTitle;
    private String jobContentTitle;
    private String commentContent;
    private String reportStatus;


    public Report toReport() {
        return Report.builder()
                .reportType(this.reportType)
                .reportContent(this.reportContent)
                .jobId(this.jobId)
                .pfId(this.pfId)
                .commentId(this.commentId)
                .userId(this.userId)
                .build();
    }
}
