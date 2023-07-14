package com.kmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kmall.domain.BoardVO;
import com.kmall.dto.Criteria;
import com.kmall.dto.PageDTO;
import com.kmall.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Setter(onMethod_ = {@Autowired})
	private BoardService boardService;
	
	
	// 게시글 쓰기폼
	@GetMapping("/insert")
	public void insert() {
		
	}
	
	// 게시글 쓰기
	@PostMapping("/insert")
	public String insert(BoardVO board) {
		
		boardService.insert(board);
		
		return "redirect:/board/list";
	}
	
	// 게시글 목록(페이징기능)
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		// 1) Model 객체 - 데이터 목록
		List<BoardVO> list = boardService.getListWithPaging(cri);
		model.addAttribute("boardList", list);
		
		int total = boardService.getTotalCount(cri);
		
		// 2) Model 객체 - 페이징기능
		PageDTO pageDTO = new PageDTO(total, cri);
		model.addAttribute("pageMaker", pageDTO);
	}
	
	// 게시글 수정폼
	@GetMapping(value = {"/get", "/modify"})
	public void get(@RequestParam("boa_bno") Long boa_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		model.addAttribute("board", boardService.get(boa_bno));
	}
	
	// 게시글 수정
	@PostMapping("/modify")
	public String modify(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
		
		boardService.modify(vo);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	// 게시글 삭제
	@GetMapping("/delete")
	public String delete(Long boa_bno, Criteria cri, RedirectAttributes rttr) {
		
		boardService.delete(boa_bno);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
}
