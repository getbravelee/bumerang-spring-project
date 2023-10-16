package com.example.bumerang.web;

import com.example.bumerang.domain.notice.Notice;
import com.example.bumerang.service.NoticeService;
import com.example.bumerang.web.dto.request.notice.WriteDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.notice.NoticeDetailDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Controller
public class NoticeController {
    private final HttpSession session;
    private final NoticeService noticeService;

    // 공지사항 작성하기 화면
    @GetMapping("/notice/writeForm")
    public String writeForm() {
        return "notice/writeForm";
    }

    // 공지사항 작성하기 기능
    @PostMapping("/notice/write")
    public @ResponseBody CMRespDto<?> write(@RequestBody WriteDto writeDto) {
        noticeService.insert(writeDto.toEntity());
        return new CMRespDto<>(1, "공지사항 작성하기 성공.", null);
    }

    // 공지사항 목록 화면
    @GetMapping("/notice/writeList")
    public String writeList(Model model) {
        List<Notice> noticeList = noticeService.findAll();
        model.addAttribute("noticeList", noticeList);
        return "notice/writeList";
    }

    // 공지사항 상세보기 화면
    @GetMapping("/notice/detailForm/{noticeId}")
    public String detailForm(@PathVariable Integer noticeId, Model model) {
        NoticeDetailDto noticeDetail = noticeService.findByNotice(noticeId);
        model.addAttribute("notice", noticeDetail);
        return "notice/detailForm";
    }
}
