package com.example.bumerang.domain.jobSearch;

import com.example.bumerang.web.dto.response.jobSearch.BestJobDto;
import com.example.bumerang.web.dto.response.jobSearch.JobDetailDto;

import java.util.List;

public interface JobSearchDao {
    public JobSearch findById(Integer jobId);

    public List<JobSearch> findAll();

    public void insert(JobSearch job);

    public void update(JobSearch job);

    public void delete(Integer jobId);

    public JobDetailDto findByJobDetail(Integer jobId);

    public void deleteJob(Integer jobId);

    public List<JobDetailDto> findAllJob();

    public List<BestJobDto> findAllBestJob();
}
