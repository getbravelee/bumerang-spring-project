package com.example.bumerang.domain.jobSearchPosition;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class JobSearchPosition {
    private Integer jobPositionId;
    private String jobPositionTitle;
    private Integer jobId;


    @Builder
    public JobSearchPosition(String jobPositionTitle, Integer jobId) {
        this.jobPositionTitle = jobPositionTitle;
        this.jobId = jobId;
    }
}
