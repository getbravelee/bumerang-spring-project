package com.example.bumerang.domain.jobSearch;

import com.example.bumerang.web.dto.response.jobSearch.JobSearchDetailDto;

import java.util.List;

public interface JobSearchDao {
    public JobSearch findById(Integer jobId);

    public List<JobSearch> findAll();

    public void insert(JobSearch jobSearch);

    public void update(JobSearch jobSearch);

    public void delete(Integer jobId);

    JobSearchDetailDto findByJobSearchDetail(Integer jobId);
}
