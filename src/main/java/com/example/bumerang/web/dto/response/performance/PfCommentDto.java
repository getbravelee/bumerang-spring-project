package com.example.bumerang.web.dto.response.performance;

import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PfCommentDto {
    private Integer commentId;
    private String commentContent;
    private Integer userId;
    private String userNickname;
    private String userProfileImg;
    private Timestamp createdAt;
}
