package com.example.bumerang.web.dto.response.jobSearch;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class JobMainDto {
    private List<JobListDto> jobList;
    private List<JobListDto> bestJobList;
}
