package com.kmall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {

	private Long ord_code;
	private String mem_id;
	private String ord_name;
	private String ord_addr_post;
	private String ord_addr_basic;
	private String ord_addr_detail;
	private String ord_tel;
	private int ord_price;
	private Date ord_regdate;
	
	private String pay_method;
	
}
