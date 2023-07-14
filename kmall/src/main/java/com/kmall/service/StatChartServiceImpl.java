package com.kmall.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kmall.dto.StatChartDTO;
import com.kmall.mapper.StatChartMapper;

import lombok.Setter;

@Service
public class StatChartServiceImpl implements StatChartService {

	@Setter(onMethod_ = {@Autowired})
	private StatChartMapper statChartMapper;

	@Override
	public List<StatChartDTO> firstCategoryOrderPrice() {

		return statChartMapper.firstCategoryOrderPrice();
	}

	@Override
	public JSONObject firstCategoryChart() {
		
		
		/*
		 google chart api 데이타 구조.
		 {"rows":
		 	[
		 	 {"c":[{"v":"PANTS"},{"v":100000}]},
		 	 {"c":[{"v":"TOP"},{"v":225100}]}
		 	],
		  "cols": 
		    [											  // JsonArray 객체
		     {"label":"1차카테고리이름","type":"string"},     // JsonObject 객체
		     {"label":"주문금액","type":"number"}           // JsonObject 객체
		    ]
		  } 
		  
		 JSONObject 클래스 : JSON데이타를 생성하는 기능 
		 JSONObject obj = new JSONObject();
		 obj.put("TOP", 5000);
		 obj.put("Pants", 15000);
		 
		 결과 : {"TOP": 5000, "Pants": 15000}
		 
		 JSONArray 클래스 :  JSON데이타를 배열로 생성하는 기능.
		 */

		List<Map<String, Object>> list = statChartMapper.firstCategoryChart();
		
		JSONObject data = new JSONObject();
		
		
		/*
		    배열구조 [ JSON Data  ]
		  [											  // JsonArray 객체
		     {"label":"1차카테고리이름","type":"string"},     // JsonObject 객체
		     {"label":"주문금액","type":"number"}           // JsonObject 객체
		    ]
		*/
		
		JSONArray title = new JSONArray();
		
		
		// {"label" : "1차카테고리이름", "type" : "string"}
		JSONObject col1 = new JSONObject();
		col1.put("label", "1차카테고리이름");
		col1.put("type", "string");
		
		// {"label" : "주문금액", "type" : "number"}
		JSONObject col2 = new JSONObject();
		col2.put("label", "주문금액");
		col2.put("type", "number");
		
		title.add(col1);
		title.add(col2);
		
		
		/*
		  "cols": 
		    [											  // JsonArray 객체
		     {"label":"1차카테고리이름","type":"string"},     // JsonObject 객체
		     {"label":"주문금액","type":"number"}           // JsonObject 객체
		    ]
		*/
		
		data.put("cols", title);
		
		/*
		  "rows":
		 	[
		 	 {"c":[{"v":"PANTS"},{"v":100000}]},
		 	 {"c":[{"v":"TOP"},{"v":225100}]}
		 	]
		 */
		
		
		// List<Map<String, Objet>> list
		JSONArray body = new JSONArray();
		for(Map<String, Object> map : list) {
			
			JSONArray row = new JSONArray();
			
			// for문 첫번째{"v" : "PANTS"}  두번째 {"v" : "TOP"}
			JSONObject categoryName = new JSONObject();
			categoryName.put("v", map.get("categoryname"));
			
			// for문 첫번째{"v" : 10000}  두번째{"v" : 225100 }
			JSONObject orderprice = new JSONObject();
			orderprice.put("v", map.get("orderprice"));
			
			
			// 배열로 추가
			/*
			  for 첫번째 [{"v":"PANTS"},{"v":100000}]
			  for 두번째 [{"v":"TOP"},{"v":225100}]
		    */
			
			row.add(categoryName);
			row.add(orderprice);
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
		}
		
		data.put("rows", body); // rows 작업완료
		
		return data;
	}

}
