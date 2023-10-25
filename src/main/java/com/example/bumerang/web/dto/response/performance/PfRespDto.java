package com.example.bumerang.web.dto.response.performance;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PfRespDto {
    private List<PfListDto> pfList;
    private List<PfListDto> bestPfList;
}
