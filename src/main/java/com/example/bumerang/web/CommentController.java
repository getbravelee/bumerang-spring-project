package com.example.bumerang.web;


import com.example.bumerang.domain.comment.Comment;
import com.example.bumerang.service.CommentService;
import com.example.bumerang.web.dto.request.comment.CommentDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CommentController {
    private final CommentService commentService;

    @Autowired
    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }
    // 댓글 리스트 불러오기
    @GetMapping("/comment")
    public @ResponseBody CMRespDto<?> commentsForm(Model model) {
        List<Comment> comments = commentService.findComments();
        model.addAttribute("comments", comments);
        return new CMRespDto<>(1, "댓글 불러오기 성공.", comments);
    }
    // 댓글 생성
    @PostMapping("/comment")
    public @ResponseBody CMRespDto<?> createComment(@RequestBody CommentDto commentDto) {
        commentService.createComment(commentDto.toComment());

        return new CMRespDto<>(1, "댓글 생성 성공.", commentDto);
    }
    // 댓글 삭제
    @DeleteMapping("/comment/delete")
    public @ResponseBody CMRespDto<?> deleteComment(@RequestBody CommentDto commentDto) {
        commentService.deleteComment(commentDto.getCommentId());

        return new CMRespDto<>(1, "댓글 삭제 성공.", commentDto);
    }
    // 댓글 수정
    @PutMapping("/comment/update")
    public @ResponseBody CMRespDto<?> updateComment(@RequestBody CommentDto commentDto) {
        commentService.updateComment(commentDto.getCommentId(), commentDto.getCommentContent());

        return new CMRespDto<>(1, "댓글 수정 성공.", commentDto);
    }
}
