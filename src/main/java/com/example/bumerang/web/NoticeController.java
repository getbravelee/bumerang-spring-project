package com.example.bumerang.web;

import com.example.bumerang.domain.comment.Comment;
import com.example.bumerang.domain.notice.Notice;
import com.example.bumerang.service.NoticeService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.comment.CommentDto;
import com.example.bumerang.web.dto.request.notice.WriteDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.notice.DetailFormDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Controller
public class NoticeController {

    private final HttpSession session;
    private final NoticeService noticeService;

    // 공지사항 목록 화면
    @GetMapping("/notice/listForm")
    public @ResponseBody CMRespDto<?> listForm() {
        List<Notice> noticeList = noticeService.findAll();
        return new CMRespDto<>(1, "공지사항 목록 화면 불러오기 성공.", noticeList);
    }

    // 공지사항 상세보기 화면
    @GetMapping("/notice/detailForm/{noticeId}")
    public @ResponseBody CMRespDto<?> detailForm(@PathVariable Integer noticeId) {
        DetailFormDto noticeDetail = noticeService.findByNotice(noticeId);
        return new CMRespDto<>(1, "공지사항 상세보기 화면 불러오기 성공.", noticeDetail);
    }

}
