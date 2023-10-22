package com.example.bumerang.domain.performance;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class Performance {
    private Integer pfId;
    private String pfTitle;
    private String pfContent;
    private String pfAgerating;
    private String pfDate;
    private String pfBookingmethod;
    private String pfProduction;
    private String pfLocation;
    private String pfRunningtime;
    private Integer pfPrice;
    private String pfGenre;
    private String pfThumbnail;
    private Integer userId;
    private String pfStatus;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
