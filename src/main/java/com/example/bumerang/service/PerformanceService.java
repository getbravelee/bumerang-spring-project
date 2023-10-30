package com.example.bumerang.service;

import com.example.bumerang.domain.performance.Performance;
import com.example.bumerang.domain.performance.PerformanceDao;
import com.example.bumerang.web.dto.request.jobSearch.DeadlineDto;
import com.example.bumerang.web.dto.response.performance.PfListDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Service
public class PerformanceService {

	private final PerformanceDao performanceDao;
	private final HttpSession session;

	//공연글 목록
	public List<Performance> findAll() {
		return performanceDao.findAll();
	}

	//공연글 마감
	public Performance deadline(DeadlineDto deadlineDto) {
		performanceDao.dead(deadlineDto);
		Performance deadlineResult = performanceDao.findById(deadlineDto.getPfId());
		return deadlineResult;
	}

	//공연글 메인 목록
	public List<PfListDto> findAllPf() {
		List<PfListDto> pfList = performanceDao.findAllPf();
		return pfList;
	}

	// 공연글 베스트 목록
	public List<PfListDto> findAllBeestPf() {
		List<PfListDto> bestPfList = performanceDao.findAllBeestPf();
		return bestPfList;
	}
}
