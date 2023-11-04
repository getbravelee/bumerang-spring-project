package com.example.bumerang.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bumerang.domain.notice.Notice;
import com.example.bumerang.service.NoticeService;
import com.example.bumerang.web.dto.response.CMRespDto;
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
        System.err.println("디버그: "+noticeList.get(0).getCreatedAt());
        model.addAttribute("noticeList", noticeList);
        return "noticeListForm";
    }

    // 공지사항 상세보기 화면
    @GetMapping("/notice/detailForm/{noticeId}")
    public String detailForm(@PathVariable Integer noticeId,Model model) {
        DetailFormDto noticeDetail = noticeService.findByNotice(noticeId);
        model.addAttribute("notice", noticeDetail);
        return "noticeDetailForm";
    }

}
