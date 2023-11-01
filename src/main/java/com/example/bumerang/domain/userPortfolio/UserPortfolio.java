package com.example.bumerang.domain.userPortfolio;

import lombok.Getter;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@Getter
public class UserPortfolio {
    private Integer upId;
    private String upTitle;
    private Integer upProdYear;
    private String upRole;
    private String upGenre;
    private String upDirector;
    private String upHistory;
    private Integer userId;
}
