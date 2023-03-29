package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReleaseDTO;

@Repository
public class ReleaseDAOImpl implements ReleaseDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.relMapper";
	
	@Override
	public List<ReleaseDTO> getRelList(PageDTO pageDTO) {
		System.out.println("ReleaseDAOImpl getWhList()");
		
		// limit #{startRow -1} , #{pageSize} 
		//        1-1, 10 => 1~10
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getRelList", pageDTO);
	}

	@Override
	public int getRelCount(PageDTO pageDTO) {
		System.out.println("ReleaseDAOImpl getRelCount()");
		return sqlSession.selectOne(namespace+".getRelCount", pageDTO);
	}

	@Override
	public void insertrel(ReleaseDTO releaseDTO) {
		System.out.println("ReleaseDAOImpl insertrel()");
		
		sqlSession.insert(namespace+".insertrel", releaseDTO);
	}

	@Override
	public Integer getRNum() {
		System.out.println("ReleaseDAOImpl getRNum()");
		
		return sqlSession.selectOne(namespace+".getRNum");
	}

}
