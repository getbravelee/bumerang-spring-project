package com.example.bumerang.domain.comment;

import lombok.Builder;
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
    private Timestamp updatedAt;

    @Builder
    public Comment(String commentContent, Integer commentId, Integer jobId, Integer pfId, Integer userId) {
        this.commentContent = commentContent;
        this.commentId = commentId;
        this.jobId = jobId;
        this.pfId = pfId;
        this.userId = userId;
    }

}