package com.example.bumerang.service;

import com.example.bumerang.domain.comment.CommentDao;
import com.example.bumerang.domain.performance.Performance;
import com.example.bumerang.domain.performance.PerformanceDao;
import com.example.bumerang.domain.view.ViewDao;
import com.example.bumerang.web.dto.request.jobSearch.DeadlineDto;
import com.example.bumerang.web.dto.request.performance.UpdateDto;
import com.example.bumerang.web.dto.request.performance.WriteDto;
import com.example.bumerang.web.dto.response.performance.DetailFormDto;
import com.example.bumerang.web.dto.response.performance.PfCommentDto;
import com.example.bumerang.web.dto.response.performance.PfListDto;
import com.example.bumerang.web.dto.response.performance.PfRespDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;


@RequiredArgsConstructor
@Service
public class PerformanceService {

	private final PerformanceDao performanceDao;
	private final CommentDao commentDao;
	private final ViewDao viewDao;
	private final HttpSession session;
	private final String imageUploadPath = "C:/bumerang/img/"; // 여기서 경로 수정

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
		List<PfListDto> bestPfList = performanceDao.findAllBestPf();
		return bestPfList;
	}

	public String uploadThumbnail(MultipartFile thumbnail) {
		if (!thumbnail.isEmpty()) {
			try {
				// 이미지 파일 이름을 랜덤으로 생성
				String fileName = UUID.randomUUID() + "_" + thumbnail.getOriginalFilename();
				Path imagePath = Paths.get(imageUploadPath + fileName);

				// 이미지 저장
				thumbnail.transferTo(imagePath.toFile());

				// 이미지 파일 경로를 반환
				return imageUploadPath + fileName;
			} catch (IOException e) {
				e.printStackTrace();
				// 이미지 업로드 실패 처리
				return null;
			}
		}
		return null;
	}

	public PfRespDto write(WriteDto writeDto) {
		performanceDao.insert(writeDto.toPerformance());
		PfRespDto pfPS = performanceDao.findByRecent();
		return pfPS;
	}

	public DetailFormDto findByPf(Integer userId, Integer pfId) {
		List<PfCommentDto> findByCommentList = commentDao.findByPfCommentList(pfId);
		DetailFormDto findByPf = performanceDao.findByPf(pfId);
		findByPf.setCommentList(findByCommentList);
		viewDao.count(pfId,null,userId);
		return findByPf;
	}

	public Performance findById(Integer pfId) {
		return performanceDao.findById(pfId);
	}

	public Performance update(UpdateDto updateDto) {
		Performance performance = updateDto.toPerformance();
		System.err.println("디버그getPfId: "+performance.getPfId());
		System.err.println("디버그getUserId: "+performance.getUserId());
		System.err.println("getPfContent: "+performance.getPfContent());
		performanceDao.update(performance);
		Performance updateResult = performanceDao.findById(updateDto.getPfId());
		return updateResult;
	}

	public Performance delete(Integer pfId) {
		performanceDao.delete(pfId);
		Performance deleteResult = performanceDao.findById(pfId);
		return deleteResult;
	}
}
