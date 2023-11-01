package com.example.bumerang.domain.view;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ViewDao {
    public View findById(Integer viewId);

    public List<View> findAll();

    public void insert(View view);

    public void count(@Param("pfId") Integer pfId, @Param("jobId") Integer jobId, @Param("userId")Integer userId);
}
