package com.example.bumerang.web.dto.response.Likey;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Getter
@Setter
public class LikeyRespDto {
    private List<LikeyJSListDto> LJSList;
    private List<LikeyPFListDto> LPFList;
}
