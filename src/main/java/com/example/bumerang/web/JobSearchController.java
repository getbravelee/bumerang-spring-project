package com.example.bumerang.web;

import com.example.bumerang.domain.jobSearch.JobSearch;
import com.example.bumerang.service.JobSearchService;
import com.example.bumerang.web.dto.request.jobSearch.UpdateDto;
import com.example.bumerang.web.dto.request.jobSearch.WriteDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.jobSearch.JobSearchDetailDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RequiredArgsConstructor
@Controller
public class JobSearchController {

    private final JobSearchService jobSearchService;

    // 구인정보 작성하기 화면
    @GetMapping("/jobSearch/writeForm")
    public String writeForm() {
        return "jobSearch/writeForm";
    }


    // 구인정보 작성하기 기능
    @PostMapping("/jobSearch/write")
    public @ResponseBody CMRespDto<?> write(@RequestBody WriteDto writeDto) {
        jobSearchService.write(writeDto);
        return new CMRespDto<>(1, "구인정보 작성하기 성공.", null);
    }

    // 구인정보 작성글 모음(테스트)
    @GetMapping("/jobSearch/writeList")
    public String writeList(Model model) {
        List<JobSearch> jobSearchList = jobSearchService.findAll();
        model.addAttribute("jobSearchList", jobSearchList);
        return "jobSearch/writeList";
    }

    // 구인정보 상세보기 화면
    @GetMapping("/jobSearch/detailForm/{jobSearchId}")
    public String detailForm(@PathVariable Integer jobSearchId, Model model) {
        JobSearchDetailDto jobSearchDetail = jobSearchService.findByJobSearch(jobSearchId);
        model.addAttribute("jobSearch", jobSearchDetail);
        return "jobSearch/detailForm";
    }

    // 구인정보 수정하기 화면
    @GetMapping("/jobSearch/updateForm/{jobSearchId}")
    public String updateForm(@PathVariable Integer jobSearchId, Model model) {
        JobSearchDetailDto jobSearchDetail = jobSearchService.findByJobSearch(jobSearchId);
        model.addAttribute("jobSearch", jobSearchDetail);
        return "jobSearch/updateForm";
    }

    // 구인정보 수정하기 기능
    @PostMapping("/jobSearch/update")
    public @ResponseBody CMRespDto<?> update(@RequestBody UpdateDto updateDto) {
        jobSearchService.update(updateDto);
        return new CMRespDto<>(1, "구인정보 수정하기 성공.", null);
    }
}
