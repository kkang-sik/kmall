package com.kmall.kakaopay;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//2)결제승인요청시 응답데이타의 하위 결제금액정보(두번째 요청)
public class Amount {

	private int total; // 전체 결제 금액
	private int tax_free; // 비과세 금액
	private int vat; // 부가세 금액
	private int point; // 사용한 포인트 금액
	private int discount; // 할인 금액
	
}
