package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Service
public interface ProductService {
	
	public void insertProduct(ProductDTO productDTO);

//	public List<ProductDTO> getProductList(PageDTO pageDTO);


	public void deleteProduct(String product_cd_name);

	public ProductDTO getProduct(String product_cd_name);

	public void updateProduct(ProductDTO productDTO);

	public int getProductCount(PageDTO pageDTO);

	public List<Map<String, Object>> getProductList(PageDTO pageDTO);

	public List<Map<String, Object>> getInstMap();

	public int getProductCount2();

	public String getProduct_cd();
	
}
