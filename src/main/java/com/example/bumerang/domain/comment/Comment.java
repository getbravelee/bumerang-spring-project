package com.example.bumerang.domain.comment;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class Comment {
    private Integer commentId;
    private String commentContent;
    private String jobId;
    private String pfId;
    private String userId;
    private Timestamp createdAt;
}