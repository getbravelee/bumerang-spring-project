package com.example.bumerang.service;

import com.example.bumerang.domain.jobSearch.JobSearch;
import com.example.bumerang.domain.jobSearch.JobSearchDao;
import com.example.bumerang.web.dto.request.jobSearch.UpdateDto;
import com.example.bumerang.web.dto.request.jobSearch.WriteDto;
import com.example.bumerang.web.dto.response.jobSearch.JobSearchDetailDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Service
public class JobSearchService {

	private final HttpSession session;
	private final JobSearchDao jobSearchDao;


	public void write(WriteDto writeDto) {
		jobSearchDao.insert(writeDto.toEntity());
	}

	public List<JobSearch> findAll() {
		return jobSearchDao.findAll();
	}

	public JobSearchDetailDto findByJobSearch(Integer jobSearchId) {
		JobSearchDetailDto jobSearchDetail = jobSearchDao.findByJobSearchDetail(jobSearchId);
		return jobSearchDetail;
	}

	public void update(UpdateDto updateDto) {

		System.err.println("디버그 서비스 진입");
		jobSearchDao.update(updateDto.toEntity());
		System.err.println("디버그 getJobId: "+updateDto.toEntity().getJobId());
		System.err.println("디버그 getUserId: "+updateDto.toEntity().getUserId());
		System.err.println("디버그 getJobContentTitle: "+updateDto.toEntity().getJobContentTitle());
		System.err.println("디버그 getJobContent: "+updateDto.toEntity().getJobContent());
	}
}
