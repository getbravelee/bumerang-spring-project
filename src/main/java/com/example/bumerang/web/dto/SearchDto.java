package com.example.bumerang.web.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SearchDto {
	private String keyword;
	private Integer page;
	private Integer startNum;
	private String jobGenre;
	private String jobPositionTitle;
	private String jobGender;
	private Boolean isDead;
}
