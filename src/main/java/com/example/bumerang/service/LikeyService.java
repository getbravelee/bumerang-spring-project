package com.example.bumerang.service;

import com.example.bumerang.domain.Likey.Likey;
import com.example.bumerang.domain.Likey.LikeyDao;
import com.example.bumerang.web.dto.request.likey.LikeyDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@RequiredArgsConstructor
@Service
public class LikeyService {

	private final LikeyDao likeyDao;

	//jobId로 구인글 찾기
	public Integer findByJobId(Integer userId, Integer jobId) {
		Integer findByJobId = likeyDao.findByJobId(userId, jobId);
		return findByJobId;
	}

	//pfId로 공연글 찾기
	public Integer findByPfId(Integer userId, Integer pfId) {
		Integer findByPfId = likeyDao.findByPfId(userId, pfId);
		return findByPfId;
	}

	//commentId로 댓글 찾기
	public Integer findByCommentId(Integer userId, Integer commentId) {
		Integer findByCommentId = likeyDao.findByCommentId(userId, commentId);
		return findByCommentId;
	}

	//구인글 추천
	public Likey likeyJob(LikeyDto likeyDto) {
		likeyDao.insert(likeyDto.toLikey());
		Likey likeyJob = likeyDao.findByRecent();
		return likeyJob;
	}

	//공연글 추천
	public Likey likeyPf(LikeyDto likeyDto) {
		likeyDao.insert(likeyDto.toLikey());
		Likey likeyJob = likeyDao.findByRecent();
		return likeyJob;
	}

	//댓글 추천
	public Likey likeyComment(LikeyDto likeyDto) {
		likeyDao.insert(likeyDto.toLikey());
		Likey likeyComment = likeyDao.findByRecent();
		return likeyComment;
	}

	//구인글 추천 취소
	public Likey unLikeyJob(Integer jobLikeyId) {
		Likey deleteResult = likeyDao.findById(jobLikeyId);
		likeyDao.delete(jobLikeyId);
		return deleteResult;
	}

	//공연글 추천 취소
	public Likey unLikeyPf(Integer pfLikeyId) {
		Likey deleteResult = likeyDao.findById(pfLikeyId);
		likeyDao.delete(pfLikeyId);
		return deleteResult;
	}

	//댓글 추천 취소
	public Likey unLikeyComment(Integer commentLikeyId) {
		Likey deleteResult = likeyDao.findById(commentLikeyId);
		likeyDao.delete(commentLikeyId);
		return deleteResult;
	}

}
