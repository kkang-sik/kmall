package com.kmall.service;

import java.util.List;

import com.kmall.domain.BoardVO;
import com.kmall.dto.Criteria;

public interface BoardService {

	void insert(BoardVO board);

	List<BoardVO> getListWithPaging(Criteria cri);

	int getTotalCount(Criteria cri);

	BoardVO get(Long boa_bno);

	void modify(BoardVO vo);

    void delete(Long boa_bno);

}
