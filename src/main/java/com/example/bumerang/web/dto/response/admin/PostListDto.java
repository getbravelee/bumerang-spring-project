package com.example.bumerang.web.dto.response.admin;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
@Getter
public class PostListDto {
    private Integer contentId;
    private String title;
    private String viewCount;
    private String genre;
    private String status;
    private String type;
    private Timestamp createdAt;
}
