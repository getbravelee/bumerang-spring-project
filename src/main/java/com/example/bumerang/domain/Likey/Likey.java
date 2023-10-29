package com.example.bumerang.domain.Likey;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class Likey {
    private Integer likeyId;
    private Integer jobId;
    private Integer pfId;
    private Integer commentId;
    private Integer userId;
    private Timestamp createdAt;

    @Builder
    public Likey(Integer jobId, Integer pfId, Integer commentId, Integer userId) {
        this.jobId = jobId;
        this.pfId = pfId;
        this.commentId = commentId;
        this.userId = userId;
    }
}