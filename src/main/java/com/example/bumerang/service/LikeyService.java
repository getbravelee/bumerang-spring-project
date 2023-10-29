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

	public Integer findByJobId(Integer userId, Integer jobId) {
		Integer findByJobId = likeyDao.findByJobId(userId, jobId);
		return findByJobId;
	}

	public Integer findByPfId(Integer userId, Integer pfId) {
		Integer findByPfId = likeyDao.findByPfId(userId, pfId);
		return findByPfId;
	}

	public Integer findByCommentId(Integer userId, Integer commentId) {
		Integer findByCommentId = likeyDao.findByCommentId(userId, commentId);
		return findByCommentId;
	}

	public Likey likeyJob(LikeyDto likeyDto) {
		likeyDao.insert(likeyDto.toLikey());
		Likey likeyJob = likeyDao.findByRecent();
		return likeyJob;
	}

	public Likey likeyPf(LikeyDto likeyDto) {
		likeyDao.insert(likeyDto.toLikey());
		Likey likeyJob = likeyDao.findByRecent();
		return likeyJob;
	}

	public Likey likeyComment(LikeyDto likeyDto) {
		likeyDao.insert(likeyDto.toLikey());
		Likey likeyComment = likeyDao.findByRecent();
		return likeyComment;
	}

	public Likey unLikeyJob(Integer jobLikeyId) {
		Likey deleteResult = likeyDao.findById(jobLikeyId);
		likeyDao.delete(jobLikeyId);
		return deleteResult;
	}

	public Likey unLikeyPf(Integer pfLikeyId) {
		Likey deleteResult = likeyDao.findById(pfLikeyId);
		likeyDao.delete(pfLikeyId);
		return deleteResult;
	}


	public Likey unLikeyComment(Integer commentLikeyId) {
		Likey deleteResult = likeyDao.findById(commentLikeyId);
		likeyDao.delete(commentLikeyId);
		return deleteResult;
	}

}
