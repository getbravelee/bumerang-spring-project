package com.example.bumerang.web.dto.request.comment;

import com.example.bumerang.domain.comment.Comment;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentDto {
    private String commentContent;
    private Integer commentId;
    private Integer jobId;
    private Integer pfId;
    private Integer userId;

    public Comment toComment() {
        return Comment.builder()
                .commentContent(this.commentContent)
                .commentId(this.commentId)
                .jobId(this.jobId)
                .pfId(this.pfId)
                .userId(this.userId)
                .build();
    }
}
