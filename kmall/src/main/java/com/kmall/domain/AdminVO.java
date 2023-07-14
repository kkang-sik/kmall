package com.kmall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AdminVO {
	
	private String admin_id;
	private String admin_pw;
	private Date admin_visit_date;

}
