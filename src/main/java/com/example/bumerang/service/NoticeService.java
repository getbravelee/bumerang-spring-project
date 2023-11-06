package com.example.bumerang.service;

import com.example.bumerang.domain.comment.Comment;
import com.example.bumerang.domain.notice.Notice;
import com.example.bumerang.domain.notice.NoticeDao;
import com.example.bumerang.web.dto.request.notice.WriteDto;
import com.example.bumerang.web.dto.response.admin.NoticeDetailDto;
import com.example.bumerang.web.dto.response.notice.DetailFormDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Service
public class NoticeService {

	private final HttpSession session;
	private final NoticeDao noticeDao;

	//공지 작성
	public void insert(Notice writeDto) {
		noticeDao.insert(writeDto);
	}

	//공지 목록
	public List<Notice> findAll() {
		return noticeDao.findAll();
	}

	//공지 상세보기
	public DetailFormDto findByNotice(Integer noticeId) {
		return noticeDao.findByNotice(noticeId);
	}

	//공지 작성
	public Notice writeNotice(WriteDto writeDto) {
		noticeDao.writeNotice(writeDto);
		Notice noticePS = noticeDao.findByRecent();
		return noticePS;
	}

	//공지 수정
	public Notice updateNotice(NoticeDetailDto noticeDetailDto) {
		noticeDao.updateNotice(noticeDetailDto);
		Notice noticePS = noticeDao.findById(noticeDetailDto.getNoticeId());
		return noticePS;
	}

	//공지 삭제
	public Notice deleteNotice(Integer noticeId) {
		noticeDao.deleteNotice(noticeId);
		return noticeDao.findById(noticeId);
	}
}
