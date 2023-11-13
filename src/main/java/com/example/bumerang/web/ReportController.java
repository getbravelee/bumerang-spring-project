package com.example.bumerang.web;

import com.example.bumerang.domain.report.Report;
import com.example.bumerang.service.ReportService;
import com.example.bumerang.web.dto.SessionUserDto;
import com.example.bumerang.web.dto.request.report.ReportDto;
import com.example.bumerang.web.dto.response.CMRespDto;
import com.example.bumerang.web.dto.response.jobSearch.JobListDto;
import com.example.bumerang.web.dto.response.jobSearch.JobRespDto;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@RequiredArgsConstructor
@Controller
public class ReportController {

    private final HttpSession session;
    private final ReportService reportService;

    // 신고 기능
    @PostMapping("/s/api/report")
    public @ResponseBody CMRespDto<?> report(@RequestBody ReportDto reportDto) {
        System.err.println("디버그getJobId: "+reportDto.getJobId());
        System.err.println("디버그getPfId: "+reportDto.getPfId());
        System.err.println("디버그getCommentId: "+reportDto.getCommentId());
        System.err.println("디버그getReportContent: "+reportDto.getReportContent());
        System.err.println("디버그getReportType: "+reportDto.getReportType());
        System.err.println("디버그getUserId: "+reportDto.getUserId());
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        Integer userId = reportDto.getUserId();
        Integer userPId = principal.getUserId();
        if (userId.equals(userPId)) {
            Integer jobId = reportDto.getJobId();
            Integer pfId = reportDto.getPfId();
            Integer commentId = reportDto.getCommentId();
            reportDto.setUserId(principal.getUserId());

            // 구인글 신고
            if (jobId != null) {
                Report jobReportResult = reportService.reportJob(reportDto);
                return new CMRespDto<>(1, "해당 구인글이 신고되었습니다.", jobReportResult);
            }

            // 공연글 신고
            if (pfId != null) {
                Report pfReportResult = reportService.reportPf(reportDto);
                return new CMRespDto<>(1, "해당 공연글이 신고되었습니다.", pfReportResult);
            }

            // 댓글 신고
            if (commentId != null) {
                Report commentReportResult = reportService.reportComment(reportDto);
                return new CMRespDto<>(1, "해당 댓글이 신고되었습니다.", commentReportResult);
            }
        }
        return new CMRespDto<>(-1, "데이터 요청을 다시 해주세요.", null);
    }

    // 공연글 신고창 화면
    @GetMapping("/s/api/reportFormPf/{targetId}/{userId}")
    public String reportFormPf(@PathVariable Integer targetId, @PathVariable Integer userId, Model model) {
        ReportDto pfInfo = reportService.findByTargetIdPf(targetId);
        model.addAttribute("pfInfo", pfInfo);
        model.addAttribute("targetId", targetId);
        model.addAttribute("userId", userId);
        return "reportFormPf";
    }

    // 구인글 신고창 화면
	@GetMapping("/s/api/reportFormJob/{targetId}/{userId}")
	public String reportFormJob(@PathVariable Integer targetId, @PathVariable Integer userId, Model model) {
        ReportDto jobInfo = reportService.findByTargetIdJob(targetId);
        model.addAttribute("jobInfo", jobInfo);
        model.addAttribute("targetId", targetId);
        model.addAttribute("userId", userId);
		return "reportFormJob";
	}

    // 댓글 신고창 화면
	@GetMapping("/s/api/reportFormComment/{targetId}/{userId}")
	public String reportFormComment(@PathVariable Integer targetId, @PathVariable Integer userId, Model model) {
        ReportDto commentInfo = reportService.findByTargetIdComment(targetId);
        model.addAttribute("commentInfo", commentInfo);
        model.addAttribute("targetId", targetId);
        model.addAttribute("userId", userId);
		return "reportFormComment";

	}
}
