package com.example.bumerang.web.dto.request.jobSearch;

import com.example.bumerang.domain.jobSearch.JobSearch;
import lombok.Getter;
import lombok.Setter;

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
    private String jobField;
    private Boolean jobGender;
    private String jobContact;
    private String jobDeadline;
    private Integer userId;

    public JobSearch toEntity() {
        return JobSearch.builder()
                .jobContentTitle(this.jobContentTitle)
                .jobContent(this.jobContent)
                .jobGenre(this.jobGenre)
                .jobArtTitle(this.jobArtTitle)
                .jobStartDate(this.jobStartDate)
                .jobProductionDate(this.jobProductionDate)
                .jobTo(this.jobTo)
                .jobField(this.jobField)
                .jobGender(this.jobGender)
                .jobContact(this.jobContact)
                .jobDeadline(this.jobDeadline)
                .userId(this.userId)
                .build();
    }
}

