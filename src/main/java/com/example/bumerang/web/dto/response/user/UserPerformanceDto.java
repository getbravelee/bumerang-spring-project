package com.example.bumerang.web.dto.response.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserPerformanceDto {
    private Integer userId;
    private Integer pfId;
    private Integer pfPrice;
    private String pfThumbnail;
    private String pfTitle;
    private String pfLocation;
    private String pfStartDate;
    private String pfDeadline;
}
