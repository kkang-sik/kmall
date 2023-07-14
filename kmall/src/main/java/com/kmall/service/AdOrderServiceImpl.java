package com.kmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmall.domain.AdOrderDetailVO;
import com.kmall.domain.OrderVO;
import com.kmall.dto.Criteria;
import com.kmall.mapper.AdOrderMapper;

import lombok.Setter;

@Service
public class AdOrderServiceImpl implements AdOrderService {

	@Setter(onMethod_ = {@Autowired})
	private AdOrderMapper adOrderMapper;

	@Override
	public List<OrderVO> orderList(Criteria cri, String sDate, String eDate) {

		return adOrderMapper.orderList(cri, sDate, eDate);
	}

	@Override
	public int getTotalCount(Criteria cri, String sDate, String eDate) {

		return adOrderMapper.getTotalCount(cri, sDate, eDate);
	}

	@Override
	public List<AdOrderDetailVO> orderDetail(Long ord_code) {

		return adOrderMapper.orderDetail(ord_code);
	}

	@Override
	public void orderDetailProductDelete(Long ord_code, Integer pro_num) {

		adOrderMapper.orderDetailProductDelete(ord_code, pro_num);
	}

	@Transactional
	@Override
	public void orderInfoDelete(Long ord_code) {
		
		// 1) 주문상세상품 삭제
		adOrderMapper.orderDetailDelete(ord_code);
		
		// 2) 주문삭제
		adOrderMapper.orderDelete(ord_code);
		
		// 3) 결제삭제
		adOrderMapper.paymentDelete(ord_code);
		
	}
}
