package com.example.bumerang.domain.likey;

import com.example.bumerang.web.dto.response.jobSearch.JobListDto;
import com.example.bumerang.web.dto.response.performance.PfListDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LikeyDao {

    public Likey findById(Integer likeyId);

    public List<Likey> findAll();

    public void insert(Likey likey);

    public void delete(Integer likeyId);

    public Integer findByJobId(@Param("userId") Integer userId, @Param("jobId") Integer jobId);

    public Integer findByPfId(@Param("userId") Integer userId, @Param("pfId") Integer pfId);

    public Integer findByCommentId(@Param("userId") Integer userId, @Param("commentId") Integer commentId);

    public Likey findByRecent();

    List<JobListDto> likeyFindSJList(Integer userId);

    List<PfListDto> likeyFindPFList(Integer userId);
}
