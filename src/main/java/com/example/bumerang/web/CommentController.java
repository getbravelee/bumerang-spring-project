package com.example.bumerang.web;


import com.example.bumerang.domain.comment.Comment;
import com.example.bumerang.service.CommentService;
import com.example.bumerang.web.dto.request.comment.CommentDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


@RequiredArgsConstructor
@Controller
public class CommentController {

    private final CommentService commentService;

    // 댓글 생성
    @PostMapping("/comment/write")
    public @ResponseBody CMRespDto<?> write(@RequestBody CommentDto commentDto) {
        commentService.create(commentDto.toComment());
        return new CMRespDto<>(1, "댓글 생성 성공.", commentDto);
    }

    // 댓글 삭제
    @DeleteMapping("/comment/delete")
    public @ResponseBody CMRespDto<?> delete(@RequestBody CommentDto commentDto) {
        commentService.delete(commentDto.getCommentId());
        return new CMRespDto<>(1, "댓글 삭제 성공.", commentDto);
    }
    
    // 댓글 수정
    @PutMapping("/comment/update")
    public @ResponseBody CMRespDto<?> update(@RequestBody CommentDto commentDto) {
        commentService.update(commentDto.getCommentId(), commentDto.getCommentContent());
        return new CMRespDto<>(1, "댓글 수정 성공.", commentDto);
    }
}
