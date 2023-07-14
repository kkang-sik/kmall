package com.kmall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	
	private String	mem_id;
	private String 	mem_name;
	private String	mem_email;
	private String 	mem_password;
	private String 	mem_zipcode;
	private String 	mem_addr;
	private String 	mem_deaddr;
	private String 	mem_phone;
	private String 	mem_receive;
	private int		mem_point;
	private Date 	mem_lastlogin;
	private Date 	mem_datesub;
	private Date 	mem_updatedate;

}
