package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ConsumptionDAO;
import com.itwillbs.domain.ConsumptionDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class ConsumptionServiceImpl implements ConsumptionService{
	
	@Inject 
	private ConsumptionDAO consumptionDAO;
	
	@Override
	public List<Map<String, Object>> getPrList(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getPrList()");
		
		int startRow = ((pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1);
		int endRow = startRow + pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return consumptionDAO.getPrList(pageDTO);
	}
	
	@Override
	public int getPrCount(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getPrCount()");
		
		return consumptionDAO.getPrCount(pageDTO);
	}
	
	@Override
	public void insertConsmpt(ConsumptionDTO[] consmptArray) {
		System.out.println("ConsumptionServiceImpl insertConsmpt()");
		
		consumptionDAO.insertConsmpt(consmptArray);
	}
	
	@Override
	public List<ConsumptionDTO> checkCprCdName(String cprCdName) {
		System.out.println("ConsumptionServiceImpl checkCprCdName()");
		
		return consumptionDAO.checkCprCdName(cprCdName);
	}
	
}// class
