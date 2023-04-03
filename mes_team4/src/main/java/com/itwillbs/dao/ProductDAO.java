package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

public interface ProductDAO {

	public void insertProduct(ProductDTO productDTO);

//	public List<ProductDTO> getProductList(PageDTO pageDTO);

	public int getProductCount(PageDTO pageDTO);
	
	public Integer getMaxNum();

	public void deleteProduct(String product_cd_name);

	public ProductDTO getProduct(String product_cd_name);

	public void updateProduct(ProductDTO productDTO);

	// map
	public List<Map<String, Object>> getInstMap();
	
	public List<Map<String, Object>> getProductList(PageDTO pageDTO);

	public int getProductCount2();

	public String getProduct_cd();




}
