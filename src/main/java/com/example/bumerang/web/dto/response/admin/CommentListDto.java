package com.example.bumerang.web.dto.response.admin;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@NoArgsConstructor
@Setter
@Getter
public class CommentListDto {
    private Integer commentId;
    private String commentContent;
    private String commentStatus;
    private String reportType;
    private String reportContent;
    private String reportCreatedAt;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
