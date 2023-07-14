package com.kmall.service;

import java.util.List;

import com.kmall.dto.CartListDTO;
import com.kmall.domain.CartVO;

public interface CartService {

	int cart_add(CartVO vo);
	
	List<CartListDTO> cart_list(String mem_id);
	
	int cart_amount_change(Long cart_code, int cart_amount);
	
	int cart_delete(Long cart_code);
	
	int cart_tot_price(String mem_id);
	
	void cart_empty(String mem_id);

}
