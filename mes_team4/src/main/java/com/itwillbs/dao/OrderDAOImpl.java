package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OMDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.orderMapper";
	@Override
	public List<OMDTO> getomlist(PageDTO pageDTO) {
		System.out.println("OrderDAOImpl getomlist()");
		
		return sqlSession.selectList(namespace + ".getomlist", pageDTO);
	}
	@Override
	public int getomcount(PageDTO pageDTO) {
		System.out.println("OrderDAOImpl getomcount()");
		
		return sqlSession.selectOne(namespace + ".getomcount", pageDTO);
	}
	@Override
	public OMDTO ominfo(int order_cd) {
		System.out.println("OrderDAOImpl ominfo()");
		
		return sqlSession.selectOne(namespace + ".ominfo", order_cd);
	}
	@Override
	public void orderinsertpro(OrderDTO orderDTO) {
		System.out.println("OrderDAOImpl orderinsertpro()");
		
		sqlSession.insert(namespace + ".orderinsertpro", orderDTO);
	}
	@Override
	public OrderDTO orderinfo(String instruction_code) {
		System.out.println("OrderDAOImpl orderinfo()");
		
		return sqlSession.selectOne(namespace + ".orderinfo", instruction_code);
	}
	
	@Override
	public void orderupdatepro(OrderDTO orderDTO) {
		System.out.println("OrderDAOImpl orderupdatepro()");
		
		sqlSession.update(namespace + ".orderupdatepro", orderDTO);
		
	}
	@Override
	public void orderdelete(String instruction_code) {
		System.out.println("OrderDAOImpl orderdelete()");
		
		sqlSession.delete(namespace + ".orderdelete", instruction_code);
	}
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
	
	
	
}
