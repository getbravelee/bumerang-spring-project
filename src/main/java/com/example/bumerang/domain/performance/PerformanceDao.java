package com.example.bumerang.domain.performance;

import com.example.bumerang.web.dto.request.jobSearch.DeadlineDto;
import com.example.bumerang.web.dto.response.performance.DetailFormDto;
import com.example.bumerang.web.dto.response.performance.PfListDto;
import com.example.bumerang.web.dto.response.performance.PfRespDto;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PerformanceDao {
    public Performance findById(Integer pfId);

    public List<Performance> findAll();

    public void insert(Performance performance);

    public void update(Performance performance);

    public void delete(Integer pfId);

    public void dead(DeadlineDto deadlineDto);

    List<PfListDto> findAllPf();

    List<PfListDto> findAllBestPf();

    PfRespDto findByRecent();

    DetailFormDto findByPf(@Param("userId")Integer userId, @Param("pfId")Integer pfId);

    public List<PfListDto> findMyPfList(Integer userId);

    public void updateNoTumbnail(Performance performance);

}
