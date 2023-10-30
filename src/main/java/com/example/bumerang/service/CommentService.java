package com.example.bumerang.service;
import com.example.bumerang.domain.comment.Comment;
import com.example.bumerang.domain.comment.CommentDao;
import com.example.bumerang.web.dto.request.comment.CommentDto;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CommentService {
    private final CommentDao commentDao;


    //댓글 작성
    public void create(Comment comment) {
        commentDao.create(comment);
    }

    //댓글 삭제
    public void delete(Integer commentId) {
        commentDao.delete(commentId);
    }

    //댓글 수정
    public void update(Integer commentId, String commentContent) {
        commentDao.update(commentId, commentContent);
    }
}
