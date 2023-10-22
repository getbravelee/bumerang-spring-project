package com.example.bumerang.domain.view;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class View {
    private Integer viewId;
    private Integer jobId;
    private Integer pfId;
    private Integer userId;
    private Timestamp createdAt;
}