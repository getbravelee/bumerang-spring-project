package com.example.bumerang.domain.comment;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class Comment {
    private Integer commentId;
    private String commentContent;
    private Integer jobId;
    private Integer pfId;
    private Integer userId;
    private String commentStatus;
    private Timestamp createdAt;
}