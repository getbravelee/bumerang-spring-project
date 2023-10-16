package com.example.bumerang.web.dto.response.notice;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
@Getter
public class NoticeDetailDto {
    // 공지사항 정보
    private Integer noticeId;
    private String noticeTitle;
    private String noticeContent;
    private String noticeType;
    private Timestamp createdAt;
    // 구인글 작성자 정보
    private Integer userId;
    private String userNickname;
    private String userProfileImg;
}

