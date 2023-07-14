package com.kmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kmall.domain.BoardReviewVO;
import com.kmall.dto.Criteria;

public interface BoardReviewMapper {

	List<BoardReviewVO> review_list(@Param("cri") Criteria cri, @Param("boa_bno") int boa_bno);

	int review_count(int boa_bno);
	
	void create(BoardReviewVO vo);
	
	void modify(BoardReviewVO vo);
	
	void delete(Long brv_num);
}
