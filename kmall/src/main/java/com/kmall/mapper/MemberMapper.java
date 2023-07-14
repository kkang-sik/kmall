package com.kmall.mapper;

import org.apache.ibatis.annotations.Param;

import com.kmall.domain.MemberVO;

public interface MemberMapper {
	
	//아이디 중복체크
	String idCheck(String mem_id);
	
	//회원가입
	void join(MemberVO vo);
	
	//로그인
	MemberVO login(String mem_id);
	
	//로그인 시간 업데이트
	void now_visit(String mem_id);
	
	//회원 수정
	void modify(MemberVO vo);
	
	//비밀번호 변경
	void pwchange(@Param("mem_id") String mem_id, @Param("new_mem_password") String new_mem_password);
	
	//회원탈퇴
	void delete(String mem_id);
}
