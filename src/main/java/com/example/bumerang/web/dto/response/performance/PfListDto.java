package com.example.bumerang.web.dto.response.performance;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PfListDto {
    private String pfTitle;
    private String pfLocation;
    private String pfDate;
    private String pfThumbnail;
    private Integer viewCount;
    // DB 칼럼 아님
    private Boolean isPrice; // true = 유료 false = 무료
}