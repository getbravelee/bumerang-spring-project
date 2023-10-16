package com.example.bumerang.web.dto.request.notice;

import com.example.bumerang.domain.notice.Notice;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WriteDto {
    private String noticeTitle;
    private String noticeContent;
    private String noticeType;
    private Integer userId;

    public Notice toEntity() {
        return Notice.builder()
                .noticeTitle(this.noticeTitle)
                .noticeContent(this.noticeContent)
                .noticeType(this.noticeType)
                .userId(this.userId)
                .build();
    }
}

