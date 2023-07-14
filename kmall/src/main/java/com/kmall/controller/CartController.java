package com.kmall.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmall.domain.CartVO;
import com.kmall.domain.MemberVO;
import com.kmall.dto.CartListDTO;
import com.kmall.service.CartService;
import com.kmall.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	// 업로드폴더 주입
	@Resource(name = "uploadPath")	// servlet-context.xml 참조
	private String uploadPath;		// c:\\dev\\upload\\pds\\
	
	
	@ResponseBody
	@PostMapping("/cart_add")
	public ResponseEntity<String> cart_add(CartVO vo, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		log.info("장바구니: " + vo);
		
		// DB작업
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
		
		if(cartService.cart_add(vo) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@GetMapping("/direct_cart_add")
	public String direct_cart_add(CartVO vo, HttpSession session) {
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
		
		cartService.cart_add(vo);
		
		return "redirect:/order/order_info";
	
	}
	
	
	@GetMapping("/cart_list")
	public void cart_list(HttpSession session, Model model) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		List<CartListDTO> cart_list = cartService.cart_list(mem_id);
		
		cart_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
			
		});
		
		model.addAttribute("cart_list", cart_list);
		
		// 장바구니 총 금액
		if(cart_list.size() != 0) {
			model.addAttribute("cart_tot_price", cartService.cart_tot_price(mem_id));
			
		}
		
	}
	
	
	@ResponseBody
	@GetMapping("/displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException {
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
		
	}
	
	
	// 장바구니에서 수량 변경
	@ResponseBody
	@PostMapping("/cart_amount_change")
	public ResponseEntity<String> cart_amount_change(Long cart_code, int cart_amount) {
		
		ResponseEntity<String> entity = null;
		
		if(cartService.cart_amount_change(cart_code, cart_amount) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
		
	}
	
	// 장바구니에서 삭제
	@ResponseBody
	@PostMapping("/cart_delete")
	public ResponseEntity<String> cart_delete(Long cart_code) {
		
		ResponseEntity<String> entity = null;
		
		if(cartService.cart_delete(cart_code) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	// 장바구니 비우기
	@GetMapping("/cart_empty")
	public String cart_empty(HttpSession session) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();

		cartService.cart_empty(mem_id);
		
		return "redirect:/cart/cart_list";
	}
}
