package com.example.bumerang.web.dto.response.performance;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;


@Getter
@Setter
public class PfRespDto {
    private Integer pfId;
    private String pfTitle;
    private String pfContent;
    private String pfAgerating;
    private String pfStartDate;
    private String pfDeadline;
    private String pfBookingmethod;
    private String pfProduction;
    private String pfLocation;
    private Integer pfRunningtime;
    private Integer pfPrice;
    private String pfGenre;
    private String pfThumbnail;
    private Integer userId;
    private String pfStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
