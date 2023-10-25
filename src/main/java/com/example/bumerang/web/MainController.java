package com.example.bumerang.web;

import com.example.bumerang.domain.jobSearch.JobSearch;
import com.example.bumerang.domain.performance.Performance;
import com.example.bumerang.service.JobSearchService;
import com.example.bumerang.service.PerformanceService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.jobSearch.DeadlineDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.jobSearch.BestJobDto;
import com.example.bumerang.web.dto.response.jobSearch.DetailFormDto;
import com.example.bumerang.web.dto.response.performance.PfListDto;
import com.example.bumerang.web.dto.response.performance.PfRespDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Controller
public class MainController {
	private final HttpSession session;
	private final JobSearchService jobSearchService;
	private final PerformanceService performanceService;

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


	// 마감하기 기능
	@PutMapping("/main/deadline")
	public @ResponseBody CMRespDto<?> deadline(@RequestBody DeadlineDto deadlineDto) {
		SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
		if (principal == null) {
			return new CMRespDto<>(-1, "로그인을 진행해주세요.", null);
		}
		Integer jobId = deadlineDto.getJobId();
		Integer pfId = deadlineDto.getPfId();
		deadlineDto.setUserId(principal.getUserId());
		Integer userId = deadlineDto.getUserId();

		if(jobId!=null){
			JobSearch deadlineResult = jobSearchService.deadline(deadlineDto);
			return new CMRespDto<>(1, "구인글 마감하기 성공.", deadlineResult);
		}

		if(pfId!=null){
			Performance deadlineResult = performanceService.deadline(deadlineDto);
			return new CMRespDto<>(1, "공연글 마감하기 성공.", deadlineResult);
		}
		return new CMRespDto<>(-1, "데이터 요청을 다시 해주세요.", null);
	}

	// 공연글 메인 화면
	@GetMapping("/performance/mainForm")
	public @ResponseBody CMRespDto<?> pfMainForm() {
		PfRespDto pfRespDto = new PfRespDto();
		List<PfListDto> pfList = performanceService.findAllPf();
		List<PfListDto> bestPfList = performanceService.findAllBeestPf();
		pfRespDto.setPfList(pfList);
		pfRespDto.setBestPfList(bestPfList);
		return new CMRespDto<>(1, "공연글 메인 화면 불러오기 성공", pfRespDto);
	}
}
