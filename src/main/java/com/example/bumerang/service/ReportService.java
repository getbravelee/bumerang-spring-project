package com.example.bumerang.service;

import com.example.bumerang.domain.report.Report;
import com.example.bumerang.domain.report.ReportDao;
import com.example.bumerang.web.dto.request.report.ReportDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@RequiredArgsConstructor
@Service
public class ReportService {

	private final ReportDao reportDao;

	//구인글 신고
	public Report reportJob(ReportDto reportDto) {
		reportDao.insert(reportDto.toReport());
		Report jobReportResult = reportDao.findByRecent();
		return jobReportResult;
	}

	//공연글 신고
	public Report reportPf(ReportDto reportDto) {
		reportDao.insert(reportDto.toReport());
		Report pfReportResult = reportDao.findByRecent();
		return pfReportResult;
	}

	//댓글 신고
	public Report reportComment(ReportDto reportDto) {
		reportDao.insert(reportDto.toReport());
		Report commentReportResult = reportDao.findByRecent();
		return commentReportResult;
	}

	public ReportDto findByTargetIdPf(Integer targetId) {
		ReportDto pfInfo = reportDao.findByTargetIdPf(targetId);
		return pfInfo;
	}

	public ReportDto findByTargetIdJob(Integer targetId) {
		ReportDto jobInfo = reportDao.findByTargetIdJob(targetId);
		return jobInfo;
	}

	public ReportDto findByTargetIdComment(Integer targetId) {
		ReportDto commentInfo = reportDao.findByTargetIdComment(targetId);
		return commentInfo;
	}
}
