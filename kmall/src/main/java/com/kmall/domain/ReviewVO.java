package com.kmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private Long	rev_num;
	private String	mem_id;
	private int	pro_num;
	private	String rev_content;
	private int	rev_score;
	private Date rev_regdate;
}
