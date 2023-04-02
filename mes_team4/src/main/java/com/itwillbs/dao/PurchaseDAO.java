package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ConsumptionDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PurchaseDTO;

public interface PurchaseDAO {
	
	public List<Map<String, Object>> getPrList(PageDTO pageDTO);
	
	public int getPrCount(PageDTO pageDTO);
	
	public List<Map<String, Object>> getBsList(PageDTO pageDTO);
	
	public int getBsCount(PageDTO pageDTO);
	
	public List<Map<String, Object>> getEmList(PageDTO pageDTO);
	
	public int getEmCount(PageDTO pageDTO);
	
	public void insertPurchase(PurchaseDTO purchaseDTO);
	
	public List<PurchaseDTO> getPurchaseList(PageDTO pageDTO);
	
	public int getPurchaseCount(PageDTO pageDTO);
	
	public PurchaseDTO getPurchaseDTO(String purchase_cd);
	
	public void deletePurchase(String[] checkedValue);
	
	public void updatePurchase(PurchaseDTO purchaseDTO);
	
}// class
