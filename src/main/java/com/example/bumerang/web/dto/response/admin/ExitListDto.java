package com.example.bumerang.web.dto.response.admin;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ExitListDto {
    private Integer dailyExitCount;
    private Integer weeklyExitCount;
}
