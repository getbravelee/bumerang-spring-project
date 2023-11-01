package com.example.bumerang.domain.comment;

import com.example.bumerang.web.dto.response.jobSearch.JobCommentDto;

import java.util.List;

public interface CommentDao {
    public Comment findById(Integer commentId);

    public List<Comment> findAll();

    public void create(Comment comment);

    public void update(Integer commentId, String commentContent);

    public void delete(Integer commentId);

    public  List<JobCommentDto> findByCommentList(Integer jobId);

    Comment findByRecent();
}
