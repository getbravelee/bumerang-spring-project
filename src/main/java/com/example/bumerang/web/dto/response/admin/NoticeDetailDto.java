package com.example.bumerang.web.dto.response.admin;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
@Getter
public class NoticeDetailDto {
    private Integer noticeId;
    private String noticeTitle;
    private String noticeContent;
    private String noticeType;
    private String noticeStatus;
    private Integer userId;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
