package com.example.bumerang.web;

import com.example.bumerang.domain.jobSearch.JobSearch;
import com.example.bumerang.service.JobSearchService;
import com.example.bumerang.web.dto.request.jobSearch.UpdateDto;
import com.example.bumerang.web.dto.request.jobSearch.WriteDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.jobSearch.DetailFormDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@RequiredArgsConstructor
@Controller
public class JobSearchController {

    private final JobSearchService jobSearchService;

    // 구인정보 작성하기 화면
    @GetMapping("/jobSearch/writeForm")
    public @ResponseBody CMRespDto<?> writeForm() {
        return new CMRespDto<>(1, "구인정보 작성하기 화면 불러오기 성공.", null);
    }

    // 구인정보 작성하기 기능
    @PostMapping("/jobSearch/write")
    public @ResponseBody CMRespDto<?> write(@RequestBody WriteDto writeDto) {
        JobSearch writeResult = jobSearchService.write(writeDto);
        return new CMRespDto<>(1, "구인정보 작성하기 성공.", writeResult);
    }
    
    // 구인정보 상세보기 화면
    @GetMapping("/jobSearch/detailForm/{jobId}")
    public @ResponseBody CMRespDto<?> detailForm(@PathVariable Integer jobId, Model model) {
        DetailFormDto jobDetail = jobSearchService.findByJob(jobId);
        jobDetail.setCommentList(jobSearchService.findByCommentList(jobId));
        return new CMRespDto<>(1, "구인정보 상세보기 화면 불러오기 성공.", jobDetail);
    }

    // 구인정보 수정하기 화면
    @GetMapping("/jobSearch/updateForm/{jobId}")
    public @ResponseBody CMRespDto<?> updateForm(@PathVariable Integer jobId) {
        DetailFormDto jobDetail = jobSearchService.findByJob(jobId);
        return new CMRespDto<>(1, "구인정보 수정하기 화면 불러오기 성공.", jobDetail);
    }

    // 구인정보 수정하기 기능
    @PutMapping("/jobSearch/update")
    public @ResponseBody CMRespDto<?> update(@RequestBody UpdateDto updateDto) {
        JobSearch updateResult = jobSearchService.update(updateDto);
        return new CMRespDto<>(1, "구인정보 수정하기 성공.", updateResult);
    }

    // 구인정보 삭제하기 기능
    @DeleteMapping("/jobSearch/delete/{jobId}")
    public @ResponseBody CMRespDto<?> delete(@PathVariable Integer jobId) {
        JobSearch deleteResult = jobSearchService.delete(jobId);
        return new CMRespDto<>(1, "구인정보 삭제하기 성공.", deleteResult);
    }
}
