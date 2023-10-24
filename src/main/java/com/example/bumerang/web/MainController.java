package com.example.bumerang.web;

import com.example.bumerang.service.JobSearchService;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.jobSearch.BestJobDto;
import com.example.bumerang.web.dto.response.jobSearch.DetailFormDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@RequiredArgsConstructor
@Controller
public class MainController {
	private final JobSearchService jobSearchService;

	@GetMapping("/")
	public @ResponseBody CMRespDto<?> mainForm() {
		return new CMRespDto<>(1, "사이트 메인페이지 불러오기 성공.",null );
	}



	// 구인정보글 메인 화면
	@GetMapping("/jobSearch/mainForm")
	public String mainForm(Model model) {
		List<DetailFormDto> jobList = jobSearchService.findAllJob();
		List<BestJobDto> bestJobList = jobSearchService.findAllBeestJob();
		model.addAttribute("jobList", jobList);
		model.addAttribute("bestJobList", bestJobList);
		return "jobSearch/mainForm";
	}
}
