package com.example.bumerang.domain.performance;

import com.example.bumerang.web.dto.request.jobSearch.DeadlineDto;

import java.util.List;

public interface PerformanceDao {
    public Performance findById(Integer pfId);

    public List<Performance> findAll();

    public void insert(Performance performance);

    public void update(Performance performance);

    public void delete(Integer pfId);

    public void dead(DeadlineDto deadlineDto);
}
