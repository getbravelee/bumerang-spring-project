package com.example.bumerang.domain.performance;

import java.util.List;

public interface PerformanceDao {
    public Performance findById(Integer performanceId);

    public List<Performance> findAll();

    public void insert(Performance performance);

    public void update(Performance performance);

    public void delete(Integer performanceId);
}
