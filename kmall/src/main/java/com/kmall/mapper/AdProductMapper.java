package com.kmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kmall.dto.Criteria;
import com.kmall.domain.CategoryVO;
import com.kmall.domain.ProductVO;

public interface AdProductMapper {
	
	// 1차카테고리.
	List<CategoryVO> getCategoryList();
	// 2차카테고리
	List<CategoryVO> subCategoryList(Integer cat_code);
	
	//상품등록
	void pro_insert(ProductVO vo);
	
	// 1)페이징기능
	List<ProductVO> getListWithPaging(@Param("cri") Criteria cri, @Param("cat_code") Integer cat_code);   //  처음 pageNum = 1, amount = 10, type=null, keyword=null
	// 2)페이징기능
	int getTotalCount(@Param("cri") Criteria cri, @Param("cat_code") Integer cat_code);
	
	ProductVO modify(Integer pro_num);
	
	CategoryVO get(int cat_code);
	
	void update(ProductVO vo);
	
	void delete(Integer pro_num);
	
	
	//선택상품수정1
	void pro_checked_modify1(List<ProductVO> pro_list);
	
	// 선택상품수정2
	void pro_checked_modify2(@Param("pro_num") Integer pro_num, @Param("pro_price") int pro_price, @Param("pro_buy") String pro_buy);

	// 선택상품삭제. 파라미터가 1)컬렉션일경우에 mybatis foreach구문에서는 list, 2)배열일 경우 array
	void pro_checked_delete(List<Integer> pro_num_arr);

}
