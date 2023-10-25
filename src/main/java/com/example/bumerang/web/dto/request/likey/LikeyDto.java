package com.example.bumerang.web.dto.request.likey;

import com.example.bumerang.domain.likey.Likey;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LikeyDto {
    private Integer likeyId;
    private Integer jobId;
    private Integer pfId;
    private Integer commentId;
    private Integer userId;


    public Likey toLikey() {
        return Likey.builder()
                .jobId(this.jobId)
                .pfId(this.pfId)
                .commentId(this.commentId)
                .userId(this.userId)
                .build();
    }
}
