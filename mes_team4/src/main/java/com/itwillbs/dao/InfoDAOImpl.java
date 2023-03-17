package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.LineDTO;

@Repository
public class InfoDAOImpl implements InfoDAO {

	//마이바티스 자동 객체생성
		@Inject
		private SqlSession sqlSession;
		
		// sql구문 전체 이름 정의
		private static final String namespace="com.itwillbs.mappers.InfoMapper";

		@Override
		public List<LineDTO> getLineList() {
			System.out.println("InfoDAOImpl getLineList()");
			
			return sqlSession.selectList(namespace+".getLineList");
		}
}
