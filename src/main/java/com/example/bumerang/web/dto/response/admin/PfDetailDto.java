package com.example.bumerang.web.dto.response.admin;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
@Getter
public class PfDetailDto {
    private Integer pfId;
    private String pfTitle;
    private String pfContent;
    private String pfAgerating;
    private String pfStartDate;
    private String pfDeadline;
    private String pfBookingmethod;
    private String pfProduction;
    private String pfLocation;
    private String pfRunningtime;
    private Integer pfPrice;
    private String pfGenre;
    private String pfThumbnail;
    private String pfStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
