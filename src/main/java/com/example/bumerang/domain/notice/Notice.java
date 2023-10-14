package com.example.bumerang.domain.notice;

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
    private Timestamp createdAt;
}