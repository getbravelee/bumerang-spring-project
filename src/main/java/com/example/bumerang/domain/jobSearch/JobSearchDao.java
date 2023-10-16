package com.example.bumerang.domain.jobSearch;

import com.example.bumerang.web.dto.response.jobSearch.JobSearchDetailDto;

import java.util.List;

public interface JobSearchDao {
    public JobSearch findById(Integer jobSearchId);

    public List<JobSearch> findAll();

    public void insert(JobSearch jobSearch);

    public void update(JobSearch jobSearch);

    public void delete(Integer jobSearchId);

    JobSearchDetailDto findByJobSearchDetail(Integer jobSearchId);
}
