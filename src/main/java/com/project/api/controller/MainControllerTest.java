package com.project.api.controller;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MainControllerTest {

	@Test
	public void testSelectApi1List() throws Exception {
		
		// 조회된 결과를 Map형태에 담음
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = new HashMap<>();
		map.put("acctNo", "11111114");
		map.put("year", "2018");
		map.put("name", "테드");
		map.put("sumAmt", "28992000");
		list.add(map);
		
		// List에서 JSONArray로 형변환
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		// JSONArray 데이터
		JSONArray jsonOutArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("acctNo", "11111114");
		jsonObject.put("year", "2018");
		jsonObject.put("name", "테드");
		jsonObject.put("sumAmt", "28992000");
		jsonOutArray.add(jsonObject);
		
		// 조회된 결과(List)를 JSONArray로 형변환한 값과  JSONArray값과 비교
		assertSame(jsonArray.getJSONObject(0).get("acctNo"),jsonOutArray.getJSONObject(0).get("acctNo"));
		assertSame(jsonArray.getJSONObject(0).get("year"),jsonOutArray.getJSONObject(0).get("year"));
		assertSame(jsonArray.getJSONObject(0).get("name"),jsonOutArray.getJSONObject(0).get("name"));
		assertSame(jsonArray.getJSONObject(0).get("sumAmt"),jsonOutArray.getJSONObject(0).get("sumAmt"));
		
		System.out.println("== testSelectApi1List 정상 ==");
		
	}

	@Test
	public void testSelectApi2List() {
		
		// 조회된 결과를 Map형태에 담음
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = new HashMap<>();
		map.put("acctNo", "11111115");
		map.put("year", "2018");
		map.put("name", "사라");
		map.put("acctNo", "11111118");
		map.put("year", "2018");
		map.put("name", "제임스");
		list.add(map);
		
		// List에서 JSONArray로 형변환
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		// JSONArray 데이터
		JSONArray jsonOutArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("acctNo", "11111115");
		jsonObject.put("year", "2018");
		jsonObject.put("name", "사라");
		jsonObject.put("acctNo", "11111118");
		jsonObject.put("year", "2018");
		jsonObject.put("name", "제임스");
		jsonOutArray.add(jsonObject);
		
		// 조회된 결과(List)를 JSONArray로 형변환한 값과  JSONArray값과 비교
		for(int i=0; i<jsonArray.size(); i++)
		{
			assertSame(jsonArray.getJSONObject(i).get("acctNo"),jsonOutArray.getJSONObject(i).get("acctNo"));
			assertSame(jsonArray.getJSONObject(i).get("year"),jsonOutArray.getJSONObject(i).get("year"));
			assertSame(jsonArray.getJSONObject(i).get("name"),jsonOutArray.getJSONObject(i).get("name"));
		}
		
		System.out.println("== testSelectApi2List 정상 ==");
	}

	@Test
	public void testSelectApi3List() {

		// 조회된 결과를 Map형태에 담음
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = new HashMap<>();
		map.put("year", "2018");
		map.put("brCode", "B");
		map.put("brName", "분당점");
		map.put("sumAmt", "38484000");
		map.put("year", "2018");
		map.put("brCode", "A");
		map.put("brName", "판교점");
		map.put("sumAmt", "20505700");
		list.add(map);
		
		// List에서 JSONArray로 형변환
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		// JSONArray 데이터
		JSONArray jsonOutArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("year", "2018");
		jsonObject.put("brCode", "B");
		jsonObject.put("brName", "분당점");
		jsonObject.put("sumAmt", "38484000");
		jsonObject.put("year", "2018");
		jsonObject.put("brCode", "A");
		jsonObject.put("brName", "판교점");
		jsonObject.put("sumAmt", "20505700");
		jsonOutArray.add(jsonObject);
		
		// 조회된 결과(List)를 JSONArray로 형변환한 값과  JSONArray값과 비교
		for(int i=0; i<jsonArray.size(); i++)
		{
			assertSame(jsonArray.getJSONObject(i).get("year"),jsonOutArray.getJSONObject(i).get("year"));
			assertSame(jsonArray.getJSONObject(i).get("brCode"),jsonOutArray.getJSONObject(i).get("brCode"));
			assertSame(jsonArray.getJSONObject(i).get("brName"),jsonOutArray.getJSONObject(i).get("brName"));
			assertSame(jsonArray.getJSONObject(i).get("sumAmt"),jsonOutArray.getJSONObject(i).get("sumAmt"));
		}
		
		System.out.println("== testSelectApi3List 정상 ==");
	}

	@Test
	public void testSelectApi4List() throws Exception {
		
		// CASE 1)
		// 조회된 결과를 Map형태에 담음
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = new HashMap<>();
		map.put("brCode", "A");
		map.put("sumAmt", "171181500");
		map.put("brName", "판교점");
		list.add(map);
		
		// List에서 JSONArray로 형변환
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		// JSONArray 데이터
		JSONArray jsonOutArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("brCode", "A");
		jsonObject.put("sumAmt", "171181500");
		jsonObject.put("brName", "판교점");
		jsonOutArray.add(jsonObject);
		
		// 조회된 결과(List)를 JSONArray로 형변환한 값과  JSONArray값과 비교
		assertSame(jsonArray.getJSONObject(0).get("brCode"),jsonOutArray.getJSONObject(0).get("brCode"));
		assertSame(jsonArray.getJSONObject(0).get("sumAmt"),jsonOutArray.getJSONObject(0).get("sumAmt"));
		assertSame(jsonArray.getJSONObject(0).get("brName"),jsonOutArray.getJSONObject(0).get("brName"));
		
		System.out.println("== testSelectApi4List 정상(CASE1) ==");
		
		// CASE 2)
		list.clear();
		map.clear();
		jsonArray.clear();
		jsonObject.clear();
		jsonOutArray.clear();
		// 조회된 값이 없을 때
		if(list.size() == 0)
		{
			map.put("code", 404+"");
			map.put("메세지", "br code not found error");
			list.add(map);
		}
		jsonArray = JSONArray.fromObject(list);
		
		jsonObject.put("code", 404+"");
		jsonObject.put("메세지", "br code not found error");
		jsonOutArray.add(jsonObject);
		assertSame(jsonArray.getJSONObject(0).get("code"),jsonOutArray.getJSONObject(0).get("code"));
		assertSame(jsonArray.getJSONObject(0).get("메세지"),jsonOutArray.getJSONObject(0).get("메세지"));
		
		System.out.println("== testSelectApi4List 정상(CASE2) ==");
	}

}
