package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{

	@Inject
	private ProductDAO productDAO;
	
	@Override
	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductServiceImpl insertProduct()");
//		if(productDAO.getMaxNum()==null) {
//		productDTO.setproduct_cd("1");
//	}else {
//		productDTO.setproduct_cd(productDAO.getMaxNum()+"1");
//	}
		productDAO.insertProduct(productDTO);
	}
	
//	@Override
//	public List<ProductDTO> getProductList(PageDTO pageDTO) {
//		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
//		int endRow= startRow+pageDTO.getPageSize()-1;
//		
//		pageDTO.setStartRow(startRow);
//		pageDTO.setEndRow(endRow);
//		
//		return productDAO.getProductList(pageDTO);
//	}
	
	@Override
	public int getProductCount(PageDTO pageDTO) {

		return productDAO.getProductCount(pageDTO);
	}
	
	@Override
	public void deleteProduct(String product_cd_name) {
		System.out.println("ProductServiceImpl deleteProduct()");
		
		productDAO.deleteProduct(product_cd_name);
	}
	
	@Override
	public ProductDTO getProduct(String product_cd_name) {
		System.out.println("ProductServiceImpl getProduct()");
		
		return productDAO.getProduct(product_cd_name);
	}
	
	@Override
	public void updateProduct(ProductDTO productDTO) {
		System.out.println("ProductServiceImpl updateProduct()");
		
		productDAO.updateProduct(productDTO);
	}
	
	@Override
	public List<Map<String, Object>> getProductList(PageDTO pageDTO) {
		System.out.println("ProductServiceImpl getProductList()");
		// 시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow= startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return productDAO.getProductList(pageDTO);
	}
	
	@Override
	public List<Map<String, Object>> getInstMap() {
		System.out.println("ProductServiceImpl getInstMap()");
		
		return productDAO.getInstMap();
	}

	@Override
	public int getProductCount2() {
		return productDAO.getProductCount2();
	}

	@Override
	public String getProduct_cd() {
		return productDAO.getProduct_cd();
	}


}
