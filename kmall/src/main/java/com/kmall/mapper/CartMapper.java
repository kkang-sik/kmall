package com.kmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kmall.dto.CartListDTO;
import com.kmall.dto.OrderListDTO;
import com.kmall.domain.CartVO;

public interface CartMapper {

	int cart_add(CartVO vo);
	
	List<CartListDTO> cart_list(String mem_id);
	
	int cart_amount_change(@Param("cart_code") Long cart_code, @Param("cart_amount") int cart_amount);
	
	int cart_delete(Long cart_code);
	
	int cart_tot_price(String mem_id);
	
	void cart_empty(String mem_id);

}
