package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.orderMapper";
	@Override
	public List<SystemDTO> getorderlist(PageDTO pageDTO) {
		System.out.println("OrderDAOImpl getorderlist()");
		
		return sqlSession.selectList(namespace + ".getorderlist", pageDTO);
	}
	@Override
	public int getsystemcount(PageDTO pageDTO) {
		System.out.println("OrderDAOImpl getsystemcount()");
		
		return sqlSession.selectOne(namespace + ".getsystemcount", pageDTO);
	}
	
	
	
}
