package com.example.bumerang.domain.performance;

import java.util.List;

public interface PerformanceDao {
    public Performance findById(Integer pfId);

    public List<Performance> findAll();

    public void insert(Performance performance);

    public void update(Performance performance);

    public void delete(Integer pfId);
}
