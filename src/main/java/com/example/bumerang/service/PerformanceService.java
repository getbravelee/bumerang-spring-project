package com.example.bumerang.service;

import com.example.bumerang.domain.performance.Performance;
import com.example.bumerang.domain.performance.PerformanceDao;
import com.example.bumerang.web.dto.request.jobSearch.DeadlineDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;


@RequiredArgsConstructor
@Service
public class PerformanceService {

	private final HttpSession session;
	private final PerformanceDao performanceDao;

	public Performance deadline(DeadlineDto deadlineDto) {
		performanceDao.dead(deadlineDto);
		Performance deadlineResult = performanceDao.findById(deadlineDto.getPfId());
		return deadlineResult;
	}
}
