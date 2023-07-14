package com.kmall.domain;

import lombok.ToString;

import java.util.Date;

import lombok.Getter;

import lombok.Setter;

@Setter
@Getter
@ToString
public class BoardVO {

	private Long boa_bno;
	private String boa_category;
	private String boa_title;
	private String mem_id;
	private String boa_content;
	private Date boa_regdate;
	private Date boa_updatedate;
}
