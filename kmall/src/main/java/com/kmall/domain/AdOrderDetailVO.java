package com.kmall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AdOrderDetailVO {

	private Long ord_code;
	private Integer	pro_num;
	private int dt_amount;
	private int dt_price;
	private String 	pro_name;
	private	String	pro_up_folder;
	private String	pro_img;
}
