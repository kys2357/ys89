package com.project.api.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MainMapper")
public class MainMapper {
	
    @Autowired
    protected SqlSessionTemplate sqlSession;
	
    /** 
     * @Description : Api1 조회
     * @return JSONArray
     */
	public List<Map<String, Object>> selectApi1List() {
        return sqlSession.selectList("selectApi1List");
    }
	
	/** 
     * @Description : Api2 조회
     * @return JSONArray
     */
	public List<Map<String, Object>> selectApi2List() {
        return sqlSession.selectList("selectApi2List");
    }
	
	/** 
     * @Description : Api3 조회
     * @return JSONArray
     */
	public List<Map<String, Object>> selectApi3List() {
        return sqlSession.selectList("selectApi3List");
    }
	
	/** 
     * @Description : Api4 조회
     * @return JSONArray
     */
	public List<Map<String, Object>> selectApi4List(Map<String, Object> param) {
        return sqlSession.selectList("selectApi4List", param);
    }
}
