package com.project.api.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.sf.json.JSONObject;

@Repository("MainMapper")
public class MainMapper {
	
    @Autowired
    protected SqlSessionTemplate sqlSession;
	
    /** 
     * @Description : Api1 조회
     * @return List<Map<String, Object>>
     */
	public List<Map<String, Object>> selectApi1List() {
        return sqlSession.selectList("selectApi1List");
    }
	
	/** 
     * @Description : Api2 조회
     * @return List<Map<String, Object>>
     */
	public List<Map<String, Object>> selectApi2List() {
        return sqlSession.selectList("selectApi2List");
    }
	
	/** 
     * @Description : Api3 조회
     * @return List<Map<String, Object>>
     */
	public List<Map<String, Object>> selectApi3List() {
        return sqlSession.selectList("selectApi3List");
    }
	
	/** 
     * @Description : Api4 조회
     * @param : JSONObject
     * @return List<Map<String, Object>>
     */
	public List<Map<String, Object>> selectApi4List(JSONObject param) {
        return sqlSession.selectList("selectApi4List", param);
    }
}
