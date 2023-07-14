package com.kmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReviewVO {

	private Long	brv_num;
	private String	mem_id;
	private int	boa_bno;
	private	String brv_content;
	private Date brv_regdate;
}
