package com.kmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kmall.domain.MemberVO;
import com.kmall.domain.ReviewVO;
import com.kmall.dto.Criteria;
import com.kmall.dto.PageDTO;
import com.kmall.service.ReviewService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/review/*")
@RestController
public class ReviewController {

	@Setter (onMethod_ = {@Autowired})
	private ReviewService reviewService;
	
	@GetMapping("/list/{pro_num}/{page}")
	public ResponseEntity<Map<String, Object>>
			review_list(@PathVariable("pro_num") int pro_num, @PathVariable("page") int page) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		Criteria cri = new Criteria();
		cri.setPageNum(page);
		
		// 1) 상품후기목록
		List<ReviewVO> list = reviewService.review_list(cri, pro_num);
		map.put("list", list);
		
		// 2) 페이징정보
		PageDTO pageMaker = new PageDTO(reviewService.review_count(pro_num), cri);
		map.put("pageMaker", pageMaker);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		
		return entity;

	}
	
	
	// 상품후기 저장 (클라이언트에서 JSON으로 데이터가 전송 -> @RequestBody로 사용됨 -> ReviewVO vo로 변환)
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReviewVO vo, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
		
		
		log.info("상품후기: " + vo);
		
		// DB연동
		reviewService.create(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	
	// 상품후기 수정
	@PatchMapping(value = "/modify", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReviewVO vo, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		// DB연동
		reviewService.modify(vo);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	
	@DeleteMapping(value = "/delete/{rev_num}")
	public ResponseEntity<String> delete(@PathVariable("rev_num") Long rev_num) {
		ResponseEntity<String> entity = null;
		
		reviewService.delete(rev_num);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
}
