package com.kmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kmall.dto.LoginDTO;
import com.kmall.domain.MemberVO;
import com.kmall.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	
	// 비밀번호 암호화
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	
	// 아이디 중복체크
	@ResponseBody
	@GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(String mem_id) {
		
		log.info("아이디: " + mem_id);
		
		ResponseEntity<String> entity = null;
		
		String isUse = "";
		if(memberService.idCheck(mem_id) != null) {
			isUse = "no";
		}else {
			isUse = "yes";
		}
		
		entity = new ResponseEntity<String>(isUse, HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/join")
	public void join() {
		log.info("회원가입 폼");
	}
	
	@PostMapping("/join")
	public String join(MemberVO vo) {
		
		log.info("회원정보: " + vo);
		
		// 비밀번호 암호화
		vo.setMem_password(passwordEncoder.encode(vo.getMem_password()));
		
		log.info("회원정보: " + vo); 
		
		memberService.join(vo);
		
		return "redirect:/member/login";
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("로그인 폼");
	}
	
	@PostMapping("/login")
	public String login(LoginDTO dto, HttpSession session, RedirectAttributes rttr) {
		
		log.info("로그인 정보: " + dto);
		
		MemberVO vo = memberService.login(dto.getMem_id());
		
		String url = "";
		String msg = "";
		
		if(vo != null) {
			if(passwordEncoder.matches(dto.getMem_password(), vo.getMem_password())) {
				session.setAttribute("loginStatus", vo); // 로그인한 사용자의 회원정보를 세션형태로 저장
				
				//로그인 시간 업데이트
				memberService.now_visit(dto.getMem_id());
				
				url = "/";
			}else {
				// 비밀번호 틀림
				url = "/member/login";
				msg = "failPW";
			}
		}else {
			// 아이디 틀림
			url = "/member/login";
			msg = "failID";
		}
		
		rttr.addFlashAttribute("msg", msg); // jsp에서 msg 사용
		
		return "redirect:" + url;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/modify")
	public void modify(Model model, HttpSession session) {
		
		// 세션에서 사용자 아이디 불러오기
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		model.addAttribute("memberVO", memberService.login(mem_id));
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		String url = "";
		String plz = "";
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		// 암호화 된 비밀번호 db에서 가지고오기
		String db_mem_password = ((MemberVO) memberService.login(mem_id)).getMem_password();
		
		if(passwordEncoder.matches(vo.getMem_password(), db_mem_password)) {
			
			memberService.modify(vo);
			
			plz = "modify";
			url = "/";
		} else {
			plz = "failPW";
			url = "/member/modify";
		}
		
		rttr.addFlashAttribute("plz", plz);
		
		return "redirect:" + url;
	}
	
	@ResponseBody
	@PostMapping("/pwchange")
	public ResponseEntity<String> pwchange(String old_mem_password, String new_mem_password, HttpSession session) {
		
		 ResponseEntity<String> entity = null;
		 String body = "";
		 
		 MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		 
		 String mem_id = vo.getMem_id();
		 
		 // 암호화 된 비밀번호 db에서 가지고오기
		 String db_mem_password = ((MemberVO) memberService.login(mem_id)).getMem_password();
		 
		 if(passwordEncoder.matches(old_mem_password, db_mem_password)) {
			 
			 // 신규비밀번호 암호화
			 String enc_mem_password = passwordEncoder.encode(new_mem_password);
			 memberService.pwchange(mem_id, enc_mem_password);
			 
			 body = "success";
		 } else {
			 body = "failPW";
		 }
		 
		 entity = new ResponseEntity<String>(body, HttpStatus.OK);
		 
		 return entity;
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public ResponseEntity<String> delete(String mem_password, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		String body = "";
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		// 암호화 된 비밀번호 db에서 가지고오기
		String db_mem_password = ((MemberVO) memberService.login(mem_id)).getMem_password();
		
		if(passwordEncoder.matches(mem_password, db_mem_password)) {
			
			// 회원탈퇴작업
			memberService.delete(mem_id);
			session.invalidate();
			
			body = "success";
		}else {
			body = "failPW";
		}
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		
		return entity;
	}
}
