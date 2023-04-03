package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.productMapper";
	
	@Override
	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductDAOImpl insertProduct()");
		
		sqlSession.insert(namespace+".insertProduct", productDTO);
	}

//	@Override
//	public List<ProductDTO> getProductList(PageDTO pageDTO) {
//		System.out.println("ProductDAOImpl getProductList()");
//		// startRow-1
//		pageDTO.setStartRow(pageDTO.getStartRow()-1);
//		return sqlSession.selectList(namespace+".getProductList", pageDTO);
//	}

	@Override
	public int getProductCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+".getProductCount", pageDTO);
	}

	@Override
	public Integer getMaxNum() {
		System.out.println("ProductDAOImpl getMaxNum()");
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public void deleteProduct(String product_cd_name) {
		System.out.println("ProductDAOImpl deleteProduct()");
		sqlSession.delete(namespace+".deleteProduct", product_cd_name);
	}

	@Override
	public ProductDTO getProduct(String product_cd_name) {
		System.out.println("ProductDAOImpl getProduct()");
		
		return sqlSession.selectOne(namespace+".getProduct",product_cd_name);
	}

	@Override
	public void updateProduct(ProductDTO productDTO) {
		System.out.println("ProductDAOImpl updateProduct()");
		
		sqlSession.update(namespace+".updateProduct", productDTO);	
	}

	@Override
	public List<Map<String, Object>> getInstMap() {
		System.out.println("ProductDAOImpl getInstMap()");
		
		return sqlSession.selectList(namespace+".getInstMap");
	}

	@Override
	public List<Map<String, Object>> getProductList(PageDTO pageDTO) {
		System.out.println("ProductDAOImpl getProductList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getProductList",pageDTO);
	}

	@Override
	public int getProductCount2() {
		
		return sqlSession.selectOne(namespace+".getProductCount2");
	}

	@Override
	public String getProduct_cd() {
		
		return sqlSession.selectOne(namespace+".getProduct_cd");
	}



}
