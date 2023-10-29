package com.example.bumerang.web.dto.response.admin;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@NoArgsConstructor
@Setter
@Getter
public class CommentDetailDto {
    private Integer commentId;
    private String commentContent;
    private Integer jobId;
    private Integer pfId;
    private Integer userId;
    private String commentStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
