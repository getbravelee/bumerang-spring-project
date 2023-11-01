package com.example.bumerang.domain.comment;

import com.example.bumerang.web.dto.response.jobSearch.JobCommentDto;
import com.example.bumerang.web.dto.response.performance.PfCommentDto;

import java.util.List;

public interface CommentDao {
    public Comment findById(Integer commentId);

    public List<Comment> findAll();

    public void create(Comment comment);

    public void update(Integer commentId, String commentContent);

    public void delete(Integer commentId);

    public  List<JobCommentDto> findByJobCommentList(Integer jobId);

    Comment findByRecent();

    List<PfCommentDto> findByPfCommentList(Integer pfId);
}
