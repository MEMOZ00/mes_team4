package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.productMapper";
	
	// 품목명 팝업 리스트 
	@Override
	public List<ProductDTO> getBnameList(PageDTO pageDTO) {
		System.out.println("ProductDAOImpl getBnameList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getPnameList",pageDTO);
	}

	@Override
	public int getProductCount() {
		System.out.println("ProductDAOImpl getProductCount()");
		
		return sqlSession.selectOne(namespace+".getProductCount");
	}

	

}
