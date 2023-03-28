package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.orderMapper";
	@Override
	public List<OrderDTO> getorderlist(PageDTO pageDTO) {
		System.out.println("OrderDAOImpl getorderlist()");
		
		return sqlSession.selectList(namespace + ".getorderlist", pageDTO);
	}
	@Override
	public int getordercount(PageDTO pageDTO) {
		System.out.println("OrderDAOImpl getordercount()");
		
		return sqlSession.selectOne(namespace + ".getordercount", pageDTO);
	}
//	@Override
//	public OMDTO ominfo(int order_cd) {
//		System.out.println("OrderDAOImpl ominfo()");
//		
//		return sqlSession.selectOne(namespace + ".ominfo", order_cd);
//	}
	@Override
	public void orderinsertpro(OrderDTO orderDTO) {
		System.out.println("OrderDAOImpl orderinsertpro()");
		
		sqlSession.insert(namespace + ".orderinsertpro", orderDTO);
	}
	@Override
	public OrderDTO orderinfo(int instruction_cd) {
		System.out.println("OrderDAOImpl orderinfo()");
		
		return sqlSession.selectOne(namespace + ".orderinfo", instruction_cd);
	}
	@Override
	public void orderdelete(int instruction_cd) {
		System.out.println("OrderDAOImpl orderdelete()");
		
		sqlSession.delete(namespace + ".orderdelete", instruction_cd);
	}
	
	
	
}
