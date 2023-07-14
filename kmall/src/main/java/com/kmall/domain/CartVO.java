package com.kmall.domain;

import lombok.ToString;

import lombok.Getter;

import lombok.Setter;

@Setter
@Getter
@ToString
public class CartVO {

	private Long cart_code;
	private Integer pro_num;
	private String mem_id;
	private int cart_amount;
	
}
