package com.kmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kmall.domain.BoardReviewVO;
import com.kmall.dto.Criteria;
import com.kmall.mapper.BoardReviewMapper;

import lombok.Setter;

@Service
public class BoardReviewServiceImpl implements BoardReviewService {

	@Setter (onMethod_ = {@Autowired})
	private BoardReviewMapper boardReviewMapper;

	@Override
	public List<BoardReviewVO> review_list(Criteria cri, int pro_num) {
		// TODO Auto-generated method stub
		return boardReviewMapper.review_list(cri, pro_num);
	}

	@Override
	public int review_count(int pro_num) {
		// TODO Auto-generated method stub
		return boardReviewMapper.review_count(pro_num);
	}

	@Override
	public void create(BoardReviewVO vo) {
		// TODO Auto-generated method stub
		boardReviewMapper.create(vo);
	}

	@Override
	public void modify(BoardReviewVO vo) {
		// TODO Auto-generated method stub
		boardReviewMapper.modify(vo);
	}

	@Override
	public void delete(Long rev_num) {
		// TODO Auto-generated method stub
		boardReviewMapper.delete(rev_num);
	}
}
