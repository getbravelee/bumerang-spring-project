package com.example.bumerang.web;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bumerang.domain.comment.Comment;
import com.example.bumerang.service.CommentService;
import com.example.bumerang.service.UserService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.comment.CommentDto;
import com.example.bumerang.web.dto.response.CMRespDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class CommentController {
    private final HttpSession session;
    private final CommentService commentService;

    // 댓글 등록
    @PostMapping("/s/api/comment/write")
    public @ResponseBody CMRespDto<?> write(@RequestBody CommentDto commentDto) {
        Comment commentPS = commentService.create(commentDto.toComment());
        return new CMRespDto<>(1, "댓글 등록 성공.", commentPS);
    }

    // 댓글 삭제
    @DeleteMapping("/s/api/comment/delete")
    public @ResponseBody CMRespDto<?> delete(@RequestBody CommentDto commentDto) {
        SessionUserDto principal = (SessionUserDto)session.getAttribute("principal");
        Integer userId = commentDto.getUserId();
        Integer userPId = principal.getUserId();
        if(userId.equals(userPId)){
            Comment commentPS = commentService.delete(commentDto.getCommentId());
            return new CMRespDto<>(1, "댓글 삭제 성공.", commentPS);
        }
        return new CMRespDto<>(-1, "올바르지 않은 요청입니다.", null);
    }
    
    // 댓글 수정
    @PutMapping("/s/api/comment/update")
    public @ResponseBody CMRespDto<?> update(@RequestBody CommentDto commentDto) {
        SessionUserDto principal = (SessionUserDto)session.getAttribute("principal");
        Integer userId = commentDto.getUserId();
        Integer userPId = principal.getUserId();
        if(userId.equals(userPId)){
            Comment commentPS = commentService.update(commentDto.getCommentId(), commentDto.getCommentContent());
            return new CMRespDto<>(1, "댓글 수정 성공.", commentPS);
        }
        return new CMRespDto<>(-1, "올바르지 않은 요청입니다.", null);
    }
}
