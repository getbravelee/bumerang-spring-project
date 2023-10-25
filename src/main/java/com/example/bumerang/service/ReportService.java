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

	public Report reportJob(ReportDto reportDto) {
		reportDao.insert(reportDto.toReport());
		Report jobReportResult = reportDao.findByRecent();
		return jobReportResult;
	}

	public Report reportPf(ReportDto reportDto) {
		reportDao.insert(reportDto.toReport());
		Report pfReportResult = reportDao.findByRecent();
		return pfReportResult;
	}

	public Report reportComment(ReportDto reportDto) {
		reportDao.insert(reportDto.toReport());
		Report commentReportResult = reportDao.findByRecent();
		return commentReportResult;
	}
}
