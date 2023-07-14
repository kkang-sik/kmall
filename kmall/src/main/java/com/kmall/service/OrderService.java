package com.kmall.service;

import java.util.List;

import com.kmall.domain.OrderVO;
import com.kmall.domain.PaymentVO;
import com.kmall.dto.CartListDTO;
import com.kmall.dto.OrderListDTO;

public interface OrderService {

	// 주문정보
	void order_save(OrderVO o_vo, PaymentVO p_vo);

}
