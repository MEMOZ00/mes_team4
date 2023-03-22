package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.DeliverDTO;



@Repository
public class DeliverDAOImpl implements DeliverDAO  {

	//마이바티스 자동 객체 생성
	@Inject
	private SqlSession sqlSession;
	
	//sql구문 이름 정의
	private static final String namespace="com.itwillbs.mappers.deliverMapper";

	@Override
	public void insertDeliver(DeliverDTO deliverDTO) {
		System.out.println("DeliverDAOImpl insertDeliver()");
		
		sqlSession.insert(namespace+".insertDeliver", deliverDTO);
	}

	@Override
	public List<DeliverDTO> getDeliverList() {
		System.out.println("DeliverDAOImpl getDeliverList()");
		
		
		return sqlSession.selectList(namespace+".getDeliverList");
	}
	
	
	

}
