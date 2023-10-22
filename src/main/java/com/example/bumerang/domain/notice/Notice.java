package com.example.bumerang.domain.notice;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class Notice {
    private Integer noticeId;
    private String noticeTitle;
    private String noticeContent;
    private String noticeType;
    private Integer userId;
    private String noticeStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    @Builder
    public Notice(String noticeTitle, String noticeContent, String noticeType, Integer userId) {
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeType = noticeType;
        this.userId = userId;
    }
}