package com.example.bumerang.web.dto.request.performance;

import com.example.bumerang.domain.performance.Performance;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class WriteDto {
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

    public Performance toPerformance() {
        return Performance.builder()
                .pfTitle(this.pfTitle)
                .pfContent(this.pfContent)
                .pfAgerating(this.pfAgerating)
                .pfStartDate(this.pfStartDate)
                .pfDeadline(this.pfDeadline)
                .pfBookingmethod(this.pfBookingmethod)
                .pfProduction(this.pfProduction)
                .pfLocation(this.pfLocation)
                .pfRunningtime(this.pfRunningtime)
                .pfPrice(this.pfPrice)
                .pfGenre(this.pfGenre)
                .pfThumbnail(this.pfThumbnail)
                .userId(this.userId)
                .build();
    }
}

