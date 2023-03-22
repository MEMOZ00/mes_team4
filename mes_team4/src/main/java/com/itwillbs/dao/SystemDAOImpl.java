package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.SystemDTO;

@Repository
public class SystemDAOImpl implements SystemDAO {
	@Inject
	private SqlSession sqlSession;

	static String namespace="com.itwillbs.mappers.systemMapper";
	@Override
	public void memberinsertpro(SystemDTO systemDTO) {
		System.out.println("SystemDAOImpl memberinsertpro()");
		
		sqlSession.insert(namespace + ".memberinsertpro", systemDTO);
	}
	@Override
	public Integer getMaxEmp_no() {
		System.out.println("SystemDAOImpl getMaxEmb_no()");
		
		return sqlSession.selectOne(namespace +".getMaxEmp_no");
	}
	
	
}
