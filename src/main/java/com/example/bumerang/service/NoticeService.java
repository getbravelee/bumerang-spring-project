package com.example.bumerang.service;

import com.example.bumerang.domain.notice.Notice;
import com.example.bumerang.domain.notice.NoticeDao;
import com.example.bumerang.web.dto.response.notice.NoticeDetailDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;


@RequiredArgsConstructor
@Service
public class NoticeService {

	private final HttpSession session;
	private final NoticeDao noticeDao;


	public void insert(Notice writeDto) {
		noticeDao.insert(writeDto);
	}

	public List<Notice> findAll() {
		return noticeDao.findAll();
	}

	public NoticeDetailDto findByNotice(Integer noticeId) {
		return noticeDao.findByNoticeDetail(noticeId);
	}
}
