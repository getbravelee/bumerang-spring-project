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

    /**
     * 댓글 찾기
     */
    public List<Comment> findComments() {
        return commentDao.findAll();
    }

    /**
     * 댓글 생성
     */
    public void createComment(Comment comment) {
        commentDao.create(comment);
    }

    /**
     * 댓글 삭제
     */
    public void deleteComment(Integer commentId) {
        commentDao.delete(commentId);
    }

    /**
     * 댓글 수정
     */
    public void updateComment(Integer commentId, String commentContent) {
        commentDao.update(commentId, commentContent);
    }
}
