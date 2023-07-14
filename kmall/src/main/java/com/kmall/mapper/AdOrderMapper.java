package com.kmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kmall.domain.AdOrderDetailVO;
import com.kmall.domain.OrderVO;
import com.kmall.dto.Criteria;

public interface AdOrderMapper {
	
	List<OrderVO> orderList(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);

	int getTotalCount(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);

	List<AdOrderDetailVO> orderDetail(Long ord_code);
	
	// 1)주문상세상품삭제
	void orderDetailDelete(Long ord_code);
	
	// 2)주문삭제
	void orderDelete(Long ord_code);
	
	// 3)결제삭제
	void paymentDelete(Long ord_code);
	
	void orderDetailProductDelete(@Param("ord_code") Long ord_code, @Param("pro_num") Integer pro_num);
	
	
}
