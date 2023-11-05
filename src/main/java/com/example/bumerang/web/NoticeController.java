package com.example.bumerang.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.bumerang.domain.notice.Notice;
import com.example.bumerang.service.NoticeService;
import com.example.bumerang.web.dto.response.notice.DetailFormDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class NoticeController {

    private final NoticeService noticeService;

    // 공지사항 목록 화면
    @GetMapping("/notice/listForm")
    public String listForm(Model model) {
        List<Notice> noticeList = noticeService.findAll();
        model.addAttribute("noticeList", noticeList);
        return "noticeListForm";
    }

    // 공지사항 상세보기 화면
    @GetMapping("/notice/detailForm/{noticeId}")
    public String detailForm(@PathVariable Integer noticeId,Model model) {
        DetailFormDto noticeDetail = noticeService.findByNotice(noticeId);
        if(noticeDetail==null){
            return "redirect:/404";
        }
        model.addAttribute("notice", noticeDetail);
        return "noticeDetailForm";
    }

    // 공지글 작성하기 화면
    @GetMapping("/s/api/auth/notice/writeForm")
    public String writeForm() {
        return "noticeWriteForm";
    }

}
