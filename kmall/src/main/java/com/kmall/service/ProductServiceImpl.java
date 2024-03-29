package com.kmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kmall.domain.CategoryVO;
import com.kmall.domain.ProductVO;
import com.kmall.dto.Criteria;
import com.kmall.mapper.ProductMapper;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = {@Autowired})
	private ProductMapper productMapper;

	@Override
	public List<CategoryVO> getCategoryList() {
		// TODO Auto-generated method stub
		return productMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> subCategoryList(Integer cat_code) {
		// TODO Auto-generated method stub
		return productMapper.subCategoryList(cat_code);
	}

	@Override
	public int pro_count(Integer cat_code, Criteria cri) {
		// TODO Auto-generated method stub
		return productMapper.pro_count(cat_code, cri);
	}

	@Override
	public List<ProductVO> pro_list(Integer cat_code, Criteria cri) {
		// TODO Auto-generated method stub
		return productMapper.pro_list(cat_code, cri);
	}

	@Override
	public ProductVO pro_detail(Integer pro_num) {
		// TODO Auto-generated method stub
		return productMapper.pro_detail(pro_num);
	}
	
	
}
