package com.kmall.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmall.domain.MemberVO;
import com.kmall.domain.OrderVO;
import com.kmall.domain.PaymentVO;
import com.kmall.dto.CartListDTO;
import com.kmall.dto.OrderListDTO;
import com.kmall.kakaopay.ApproveResponse;
import com.kmall.kakaopay.ReadyResponse;
import com.kmall.service.CartService;
import com.kmall.service.KakaoPayService;
import com.kmall.service.MemberService;
import com.kmall.service.OrderService;
import com.kmall.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/order/*")
@Controller
public class OrderController {
	
	@Resource(name = "cid")
	private String cid;

	@Setter(onMethod_ = {@Autowired})
	private OrderService orderService;
	
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	
	@Setter(onMethod_ = {@Autowired})
	private KakaoPayService kakaoPayService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@GetMapping("/order_info")
	public void order_info(HttpSession session, Model model) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
				
		// 장바구니 상품
		List<CartListDTO> cart_list = cartService.cart_list(mem_id);
		
		cart_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		
		
		// 주문상품명
		String order_productName = cart_list.get(0).getPro_name() + "외" + (cart_list.size() - 1) + " 건";
		model.addAttribute("order_productName", order_productName);
		
		// 주문목록
		model.addAttribute("cart_list", cart_list);
		
		// 주문총금액
		model.addAttribute("cart_tot_price", cartService.cart_tot_price(mem_id));
		
		// 주문자 정보
		model.addAttribute("memberVO", memberService.login(mem_id));
		
	}
	
	
	// 주문하기 : 결제준비 요청
	@GetMapping("/orderbuy")
	@ResponseBody
	public ReadyResponse orderPay(String pay_type, String order_productName, OrderVO o_vo, PaymentVO p_vo, HttpSession session) {
		
		ReadyResponse readyResponse = new ReadyResponse();
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		// 주문테이블과 결제테이블에서 아이디 저장
		o_vo.setMem_id(mem_id);
		p_vo.setMem_id(mem_id);
		
		// 무통장 결제
		if(pay_type.equals("bank")) {
			orderService.order_save(o_vo, p_vo);
		}
		
		// 카카오페이 결제
		if(pay_type.equals("kakaopay")) {
			
			p_vo.setPay_user(p_vo.getMem_id());
			p_vo.setPay_bank("kakaopay");
			
			orderService.order_save(o_vo, p_vo);
			
			// 결제준비요청 성공시 사용주소
			String approval_url = "http://localhost:8081/order/orderApproval";
			// 결제준비요청 취소시 사용주소
			String cancel_url = "http://localhost:8081/order/orderCancel";
			// 결제실패시 사용주소
			String fail_url = "http://localhost:8081/order/orderFail";
			
			// 결제준비요청 작업 및 응답데이터
			readyResponse = kakaoPayService.payReady(cid, o_vo.getOrd_code(), mem_id, order_productName, 1, o_vo.getOrd_price(), 0, approval_url, cancel_url, fail_url);
			
			session.setAttribute("tid", readyResponse.getTid());
			session.setAttribute("ord_code", o_vo.getOrd_code());
			
		}
		
		return readyResponse;
	
	}
	
	@GetMapping("/orderApproval")
	public String orderApproval(String pg_token, HttpSession session) {
		
		String tid = (String) session.getAttribute("tid");
		session.removeAttribute("tid");
		
		Long ord_code = (Long) session.getAttribute("ord_code");
		session.removeAttribute("ord_code");
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		
		// 결제승인요청작업 (응답데이터는 현재 사용X)
		ApproveResponse approveResponse = kakaoPayService.payApprove(cid, tid, ord_code, mem_id, pg_token);
		
		// 결제 성공 결과페이지 주소
		return "redirec:/order/orderComplete";
	}
	
	
	// 카카오페이 결제및주문 완료
	@GetMapping("/orderComplete")
	public String orderComplete() {
		
		return "/order/order_complete";
	}
	
	// 결제준비요청 취소
	@GetMapping("/orderCancel")
	public void orderCancel() {
		
	}
	
	// 결제준비요청 실패
	@GetMapping("/orderFail")
	public void orderFail() {
		
	}
	
}
