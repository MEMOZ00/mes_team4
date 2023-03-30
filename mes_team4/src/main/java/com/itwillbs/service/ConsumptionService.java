package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ConsumptionDTO;
import com.itwillbs.domain.PageDTO;

public interface ConsumptionService {
	
	public List<Map<String, Object>> getPrList(PageDTO pageDTO);
	
	public int getPrCount(PageDTO pageDTO);
	
	public void insertConsmpt(ConsumptionDTO[] consmptArray);
	
	public List<ConsumptionDTO> checkCprCdName(String cprCdName);
	
	public List<ConsumptionDTO> getCprConsmptList(PageDTO pageDTO);
	
	public int getCprConsmptCount(PageDTO pageDTO);
	
	public List<ConsumptionDTO> getRprConsmptList(String[] cprCdName);
	
	public List<Integer> getRowcolsTd(PageDTO pageDTO);
}// class
