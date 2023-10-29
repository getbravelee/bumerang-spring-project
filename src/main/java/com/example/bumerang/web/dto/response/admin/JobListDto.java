package com.example.bumerang.web.dto.response.admin;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.sql.Timestamp;

@NoArgsConstructor
@Setter
@Getter
public class JobListDto {
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
    private String jobView;
    private String reportType;
    private String reportContent;
    private String reportCreatedAt;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
