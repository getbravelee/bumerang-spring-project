package com.example.bumerang.web.dto.response.jobSearch;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BestJobDto {
    private String jobRank; // DB 칼럼아님
    private String jobContentTitle;
    private String jobGenre;
    private String jobDeadline;
    private Integer jobView;
}
