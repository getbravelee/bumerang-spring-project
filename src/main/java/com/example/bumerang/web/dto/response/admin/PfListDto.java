package com.example.bumerang.web.dto.response.admin;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.sql.Timestamp;

@NoArgsConstructor
@Setter
@Getter
public class PfListDto {
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
    private Integer pfView;
    private String pfGenre;
    private String pfThumbnail;
    private Integer userId;
    private String pfStatus;
    private String reportType;
    private String reportContent;
    private String reportCreatedAt;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
