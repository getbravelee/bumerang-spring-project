package com.example.bumerang.web.dto.request.jobSearch;

import com.example.bumerang.domain.jobSearch.JobSearch;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateDto {
    private String jobContentTitle;
    private String jobContent;
    private String jobGenre;
    private String jobArtTitle;
    private String jobStartDate;
    private String jobProductionDate;
    private Integer jobTo;
    private String jobGender;
    private String jobContact;
    private String jobDeadline;
    private Integer userId;
    private Integer jobId;

    public JobSearch toEntity() {
        return JobSearch.builder()
                .jobContentTitle(this.jobContentTitle)
                .jobContent(this.jobContent)
                .jobGenre(this.jobGenre)
                .jobArtTitle(this.jobArtTitle)
                .jobStartDate(this.jobStartDate)
                .jobProductionDate(this.jobProductionDate)
                .jobTo(this.jobTo)
                .jobGender(this.jobGender)
                .jobContact(this.jobContact)
                .jobDeadline(this.jobDeadline)
                .jobId(this.jobId)
                .userId(this.userId)
                .build();
    }
}

