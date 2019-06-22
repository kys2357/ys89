package com.project.api.service.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.project.api.service.MainService;
import com.project.api.mapper.MainMapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Resource(name = "MainMapper")
    private MainMapper mainMapper;

	/** 
     * @Description : Api1 조회
     * @return JSONArray
     */
	@Override
    public JSONArray selectApi1List() {
		
		List<Map<String, Object>> list = mainMapper.selectApi1List();
		JSONArray jsonArray = JSONArray.fromObject(list);
        return jsonArray;
    }
	
	/** 
     * @Description : Api2 조회
     * @return JSONArray
     */
	@Override
    public JSONArray selectApi2List() {
		
		List<Map<String, Object>> list = mainMapper.selectApi2List();
		JSONArray jsonArray = JSONArray.fromObject(list);
        return jsonArray;
    }
	
	/** 
     * @Description : Api3 조회
     * @return JSONObject
     */
	@Override
    public JSONObject selectApi3List() {
		
		List<Map<String, Object>> list = mainMapper.selectApi3List();
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		JSONObject jsonGroupObject = new JSONObject();
		JSONArray jsonSubArray = new JSONArray();
		String year = "";
		for(int i=0; i<jsonArray.size(); i++)
		{
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			BigDecimal sumAmt = new BigDecimal(String.valueOf(jsonObject.get("sumAmt")));
			if(year.equals(jsonObject.get("year")))
			{
				JSONObject jsonChildObject = new JSONObject();
				jsonChildObject.put("brCode", (String) jsonObject.get("brCode"));
				jsonChildObject.put("brName", (String) jsonObject.get("brName"));
				jsonChildObject.put("sumAmt", sumAmt);
				jsonSubArray.add(jsonChildObject);
				
				if(i == jsonArray.size() - 1)
				{
					jsonGroupObject.put(year.toString(), jsonSubArray);
				}
			}
			else
			{
				if(!year.equals(""))
				{
					jsonGroupObject.put(year.toString(), jsonSubArray);
					jsonSubArray.clear();
				}
				JSONObject jsonChildObject = new JSONObject();
				jsonChildObject.put("brCode", (String) jsonObject.get("brCode"));
				jsonChildObject.put("brName", (String) jsonObject.get("brName"));
				jsonChildObject.put("sumAmt", sumAmt);
				jsonSubArray.add(jsonChildObject);
				year = (String) jsonObject.get("year");
			}
		}
        return jsonGroupObject;
    }

	/** 
     * @Description : Api4 조회
     * @param : JSONObject
     * @return JSONArray
     */
	@Override
    public JSONArray selectApi4List(JSONObject param) {
		
		List<Map<String, Object>> list = mainMapper.selectApi4List(param);
		// 조회 결과가 없으면 [br code not found error] 메세지를 넘김.
		if(list.size() == 0)
		{
			Map<String, Object> map = new HashMap<>();
			map.put("code", 404);
			map.put("메세지", "br code not found error");
			list.add(map);
		}
		JSONArray jsonArray = JSONArray.fromObject(list);
        return jsonArray;
    }

}
