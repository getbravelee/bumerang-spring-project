package com.example.bumerang.domain.comment;

import com.example.bumerang.web.dto.response.jobSearch.JobCommentDto;

import java.util.List;

public interface CommentDao {
    public Comment findById(Integer commentId);

    public List<Comment> findAll();

    public void insert(Comment comment);

    public void update(Comment comment);

    public void delete(Integer commentId);

    public  List<JobCommentDto> findByCommentList(Integer jobId);
}
