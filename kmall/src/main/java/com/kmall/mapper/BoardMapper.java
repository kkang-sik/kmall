package com.kmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kmall.domain.BoardVO;
import com.kmall.dto.Criteria;

public interface BoardMapper {

	void insert(BoardVO board);

	List<BoardVO> getListWithPaging(Criteria cri);

	int getTotalCount(Criteria cri);

	BoardVO get(Long boa_bno);
	
	void modify(BoardVO vo);
	
	/* void delete(Long boa_bno); */

    void delete(@Param("boa_bno") Long boa_bno);
    
    void deleteReview(@Param("boa_bno") Long boa_bno);
}
