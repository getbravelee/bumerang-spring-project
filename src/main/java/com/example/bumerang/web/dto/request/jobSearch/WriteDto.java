package com.example.bumerang.web.dto.request.jobSearch;

import com.example.bumerang.domain.jobSearch.JobSearch;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class WriteDto {
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
    private List<String> jobPositionList;
    private Integer userId;

    public JobSearch toJobSearch() {
        return JobSearch.builder()
                .jobContentTitle(this.jobContentTitle)
                .jobContent(this.jobContent)
                .jobGenre(this.jobGenre)
                .jobArtTitle(this.jobArtTitle)
                .jobStartDate(this.jobStartDate)
                .jobProductionDate(this.jobProductionDate)
                .jobTo(this.jobTo)
                .jobPay(this.jobPay)
                .jobGender(this.jobGender)
                .jobContact(this.jobContact)
                .jobDeadline(this.jobDeadline)
                .userId(this.userId)
                .build();
    }
}

