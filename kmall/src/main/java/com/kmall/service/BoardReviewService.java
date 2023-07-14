package com.kmall.service;

import java.util.List;

import com.kmall.domain.BoardReviewVO;
import com.kmall.dto.Criteria;

public interface BoardReviewService {

	List<BoardReviewVO> review_list(Criteria cri, int boa_bno);

	int review_count(int boa_bno);

	void create(BoardReviewVO vo);

	void modify(BoardReviewVO vo);

	void delete(Long brv_num);

}
