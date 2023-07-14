package com.kmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kmall.domain.ReviewVO;
import com.kmall.dto.Criteria;

public interface ReviewMapper {

	List<ReviewVO> review_list(@Param("cri") Criteria cri, @Param("pro_num") int pro_num);

	int review_count(int pro_num);
	
	void create(ReviewVO vo);
	
	void modify(ReviewVO vo);
	
	void delete(Long rev_num);
}
