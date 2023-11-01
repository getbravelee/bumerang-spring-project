package com.example.bumerang.service;
import com.example.bumerang.domain.comment.Comment;
import com.example.bumerang.domain.comment.CommentDao;
import com.example.bumerang.web.dto.request.comment.CommentDto;
import java.util.List;

import com.example.bumerang.web.dto.response.jobSearch.JobRespDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CommentService {
    private final CommentDao commentDao;


    //댓글 작성
    public Comment create(Comment comment) {
        commentDao.create(comment);
        Comment commentPS = commentDao.findByRecent();
        return commentPS;
    }

    //댓글 삭제
    public Comment delete(Integer commentId) {
        commentDao.delete(commentId);
        Comment commentPS = commentDao.findById(commentId);
        return commentPS;
    }

    //댓글 수정
    public Comment update(Integer commentId, String commentContent) {
        commentDao.update(commentId, commentContent);
        Comment commentPS = commentDao.findById(commentId);
        return commentPS;
    }
}
