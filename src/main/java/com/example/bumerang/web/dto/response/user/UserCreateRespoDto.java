package com.example.bumerang.web.dto.response.user;

import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCreateRespoDto {
    List<UserJobSearchDto> myJSList;
    List<UserPerformanceDto> myPfList;
}
