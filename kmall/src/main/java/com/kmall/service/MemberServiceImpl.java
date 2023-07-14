package com.kmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kmall.domain.MemberVO;
import com.kmall.mapper.MemberMapper;
import com.kmall.service.MemberService;

import lombok.Setter;

@Service
public class MemberServiceImpl  implements MemberService{

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;

	
	
	@Override
	public String idCheck(String mem_id) {
		// TODO Auto-generated method stub
		return memberMapper.idCheck(mem_id);
	}

	@Override
	public void join(MemberVO vo) {
		// TODO Auto-generated method stub
		memberMapper.join(vo);
	}

	@Override
	public MemberVO login(String mem_id) {
		// TODO Auto-generated method stub
		return memberMapper.login(mem_id);
	}

	@Override
	public void now_visit(String mem_id) {
		// TODO Auto-generated method stub
		memberMapper.now_visit(mem_id);
	}

	@Override
	public void modify(MemberVO vo) {
		// TODO Auto-generated method stub
		memberMapper.modify(vo);
	}

	@Override
	public void pwchange(String mem_id, String new_mem_password) {
		// TODO Auto-generated method stub
		memberMapper.pwchange(mem_id, new_mem_password);
	}

	@Override
	public void delete(String mem_id) {
		// TODO Auto-generated method stub
		memberMapper.delete(mem_id);
	}
	
	
	
}
