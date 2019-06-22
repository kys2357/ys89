package com.project.api.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface MainService {
	
	/** 
     * @Description : Api1 조회
     * @return JSONArray
     */
	JSONArray selectApi1List() throws Exception;
	
	/** 
     * @Description : Api2 조회
     * @return JSONArray
     */
	JSONArray selectApi2List() throws Exception;
	
	/** 
     * @Description : Api3 조회
     * @return JSONObject
     */
	JSONObject selectApi3List() throws Exception;
	
	/** 
     * @Description : Api4 조회
     * @param : JSONObject
     * @return JSONArray
     */
	JSONArray selectApi4List(JSONObject param) throws Exception;
}
