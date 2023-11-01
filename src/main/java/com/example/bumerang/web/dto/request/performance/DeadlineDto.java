package com.example.bumerang.web.dto.request.performance;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeadlineDto {
    private Integer jobId;
    private Integer pfId;
    private Integer userId;
}
