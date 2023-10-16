package com.example.bumerang.domain.notice;

import com.example.bumerang.web.dto.response.notice.NoticeDetailDto;

import java.util.List;

public interface NoticeDao {
    public Notice findById(Integer noticeId);

    public List<Notice> findAll();

    public void insert(Notice notice);

    public void update(Notice notice);

    public void delete(Integer noticeId);

    public NoticeDetailDto findByNoticeDetail(Integer noticeId);
}
