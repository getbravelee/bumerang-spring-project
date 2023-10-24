package com.example.bumerang.web;

import com.example.bumerang.service.JobSearchService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.jobSearch.UpdateDto;
import com.example.bumerang.web.dto.request.jobSearch.WriteDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.jobSearch.DetailFormDto;
import com.example.bumerang.web.dto.response.jobSearch.JobRespDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@RequiredArgsConstructor
@Controller
public class JobSearchController {

    private final HttpSession session;
    private final JobSearchService jobSearchService;

    // 구인정보 작성하기 화면
    @GetMapping("/jobSearch/writeForm")
    public @ResponseBody CMRespDto<?> writeForm() {
        return new CMRespDto<>(1, "구인정보 작성하기 화면 불러오기 성공.", null);
    }

    // 구인정보 작성하기 기능
    @PostMapping("/jobSearch/write")
    public @ResponseBody CMRespDto<?> write(@RequestBody WriteDto writeDto) {
        JobRespDto writeResult = jobSearchService.write(writeDto);
        return new CMRespDto<>(1, "구인정보 작성하기 성공.", writeResult);
    }
    
    // 구인정보 상세보기 화면
    @GetMapping("/jobSearch/detailForm/{jobId}")
    public @ResponseBody CMRespDto<?> detailForm(@PathVariable Integer jobId, Model model) {
        SessionUserDto userPS = (SessionUserDto)session.getAttribute("principal");
        if(userPS==null){
            return new CMRespDto<>(-1, "로그인 해주세요.", null);
        }
        DetailFormDto jobDetail = jobSearchService.findByJob(userPS, jobId);
        return new CMRespDto<>(1, "구인정보 상세보기 화면 불러오기 성공.", jobDetail);
    }

    // 구인정보 수정하기 화면
    @GetMapping("/jobSearch/updateForm/{jobId}")
    public @ResponseBody CMRespDto<?> updateForm(@PathVariable Integer jobId) {
        SessionUserDto userPS = (SessionUserDto)session.getAttribute("principal");
        if(userPS==null){
            return new CMRespDto<>(-1, "로그인 해주세요.", null);
        }
        DetailFormDto jobDetail = jobSearchService.findByJob(userPS, jobId);
        return new CMRespDto<>(1, "구인정보 수정하기 화면 불러오기 성공.", jobDetail);
    }

    // 구인정보 수정하기 기능
    @PutMapping("/jobSearch/update")
    public @ResponseBody CMRespDto<?> update(@RequestBody UpdateDto updateDto) {
        JobRespDto updateResult = jobSearchService.update(updateDto);
        return new CMRespDto<>(1, "구인정보 수정하기 성공.", updateResult);
    }

    // 구인정보 삭제하기 기능
    @DeleteMapping("/jobSearch/delete/{jobId}")
    public @ResponseBody CMRespDto<?> delete(@PathVariable Integer jobId) {
        JobRespDto deleteResult = jobSearchService.delete(jobId);
        return new CMRespDto<>(1, "구인정보 삭제하기 성공.", deleteResult);
    }
}
