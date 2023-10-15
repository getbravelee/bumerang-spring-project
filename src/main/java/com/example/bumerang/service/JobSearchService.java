package com.example.bumerang.service;

import com.example.bumerang.domain.jobSearch.JobSearch;
import com.example.bumerang.domain.jobSearch.JobSearchDao;
import com.example.bumerang.web.dto.request.jobSearch.WriteDto;
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
}
