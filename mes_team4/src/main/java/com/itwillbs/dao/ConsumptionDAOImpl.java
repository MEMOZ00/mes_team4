package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ConsumptionDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class ConsumptionDAOImpl implements ConsumptionDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.ConsumptionMapper";
	
	@Override
	public List<Map<String, Object>> getPrList(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getPrList()");

		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		if (pageDTO.getProduct_dv().equals("cp")) {
			return sqlSession.selectList(namespace+".getCpList", pageDTO);
		} 
		else if (pageDTO.getProduct_dv().equals("rp")) {
			return sqlSession.selectList(namespace+".getRpList", pageDTO);
		} 
		else {
			return null;
		}
	} 
	
	@Override
	public int getPrCount(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getPrCount()");
		
		if (pageDTO.getProduct_dv().equals("cp")) {
			return sqlSession.selectOne(namespace+".getCpCount", pageDTO);
		} 
		else if (pageDTO.getProduct_dv().equals("rp")) {
			return sqlSession.selectOne(namespace+".getRpCount", pageDTO);
		} 
		else {
			return 0;
		}
	} 
	
	@Override
	public void insertConsmpt(ConsumptionDTO[] consmptArray) {
		System.out.println("ConsumptionDAOImpl insertConsmpt()");
		
		sqlSession.insert(namespace+".insertConsmpt", Map.of("consmptArray" ,consmptArray));
	}
	
	@Override
	public List<ConsumptionDTO> checkCprCdName(String cprCdName) {
		System.out.println("ConsumptionDAOImpl checkCprCdName()");
		
		return sqlSession.selectList(namespace+".checkCprCdName", cprCdName);
	}
}// class
