package com.kmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmall.domain.BoardVO;
import com.kmall.dto.Criteria;
import com.kmall.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = {@Autowired})
	private BoardMapper boardMapper;

	@Override
	public void insert(BoardVO board) {
		// TODO Auto-generated method stub
		boardMapper.insert(board);
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.getTotalCount(cri);
	}

	@Override
	public BoardVO get(Long boa_bno) {
		// TODO Auto-generated method stub
		return boardMapper.get(boa_bno);
	}

	@Override
	public void modify(BoardVO vo) {
		// TODO Auto-generated method stub
		boardMapper.modify(vo);
	}

	@Transactional
	@Override
	public void delete(Long boa_bno) {
		// TODO Auto-generated method stub
		boardMapper.delete(boa_bno);
		boardMapper.deleteReview(boa_bno);
	}
}
