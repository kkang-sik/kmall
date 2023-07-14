package com.kmall.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.kmall.dto.StatChartDTO;

public interface StatChartService {
	
	public List<StatChartDTO> firstCategoryOrderPrice();

	public JSONObject firstCategoryChart();

}
