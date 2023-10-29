package com.example.bumerang.web.dto.response.admin;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.sql.Timestamp;

@NoArgsConstructor
@Setter
@Getter
public class NoticeListDto {
    private Integer noticeId;
    private String noticeTitle;
    private String noticeContent;
    private String noticeType;
    private Integer userId;
    private String noticeStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
