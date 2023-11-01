package com.example.bumerang.domain.jobSearchPosition;

import java.util.List;

public interface JobSearchPositionDao {
    public JobSearchPosition findById(Integer jobPositionId);

    public List<JobSearchPosition> findAll();

    void insert(String jobPositionTitle, Integer jobId);

    public void update(JobSearchPosition jobPosition);

    public void delete(Integer jobPositionId);

    public void insertPosition(String jobPositionTitle, Integer jobId);

    public List<String> findPositionList(Integer jobId);

}
