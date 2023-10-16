package com.example.bumerang.web.dto.response.jobSearch;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
@Getter
public class JobCommentDto {
    private Integer commentId;
    private String commentContent;
    private String userNickname;
    private String userProfileImg;
    private Timestamp createdAt;
}
