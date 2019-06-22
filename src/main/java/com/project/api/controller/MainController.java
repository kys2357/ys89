package com.project.api.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.api.service.MainService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MainController {
	
	@Resource(name = "mainService")
	private MainService mainService;

	/** 
     * @Description : Api1 조회
     * @return JSONArray
     */
	@ResponseBody
	@RequestMapping(value = "/api1Search.do", method = RequestMethod.POST)
	public JSONArray selectApi1List() throws Exception {
		JSONArray jsonArray = mainService.selectApi1List();
		return jsonArray;
	}
	
	/** 
     * @Description : Api2 조회
     * @return JSONArray
     */
	@ResponseBody
	@RequestMapping(value = "/api2Search.do", method = RequestMethod.POST)
	public JSONArray selectApi2List() throws Exception {
		JSONArray jsonArray = mainService.selectApi2List();
		return jsonArray;
	}
	
	/** 
     * @Description : Api3 조회
     * @return JSONObject
     */
	@ResponseBody
	@RequestMapping(value = "/api3Search.do", method = RequestMethod.POST)
	public JSONObject selectApi3List() throws Exception {
		JSONObject jsonObject = mainService.selectApi3List();
		return jsonObject;
	}
	
	/** 
     * @Description : Api1 조회
     * @param : JSONObject
     * @return JSONArray
     */
	@ResponseBody
	@RequestMapping(value = "/api4Search.do", method = RequestMethod.POST)
	public JSONArray selectApi4List(@RequestBody JSONObject param) throws Exception {
		System.out.println(param);
		JSONArray jsonArray = mainService.selectApi4List(param);
		return jsonArray;
	}
}