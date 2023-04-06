package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReceiveDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReceiveDTO;
import com.itwillbs.domain.StockDTO;

@Service
public class ReceiveServiceImpl implements ReceiveService{

	@Inject
	private ReceiveDAO receiveDAO;
	
	@Override
	public void insertReceive(ReceiveDTO receiveDTO) {
		System.out.println("insertReceive()");
		if(receiveDAO.getCNum()==null) {
			//출고품목 없음
			receiveDTO.setRec_schedule_cd("C001");
		}else{
			System.out.println("LNum 출력 : "+receiveDAO.getCNum());
			int num = receiveDAO.getCNum()+1;
			String str = "C00" + num;
			
			receiveDTO.setRec_schedule_cd(str);
		}
		
		receiveDAO.insertReceive(receiveDTO);
	}

	@Override
	public List<ReceiveDTO> getReceiveList(PageDTO pageDTO) {
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			return receiveDAO.getReciveList(pageDTO);
	}

	@Override
	public int getReceiveCount(PageDTO pageDTO) {
		return receiveDAO.getReceiveCount(pageDTO);
	}

	@Override
	public ReceiveDTO getReceive(String rec_schedule_cd) {
		System.out.println("ReceiveServiceImpl getReceive()");
		
		return receiveDAO.getReceive(rec_schedule_cd);
	}

	@Override
	public void updateReceive(ReceiveDTO receiveDTO) {
		System.out.println("updateReceive()");
		
		receiveDAO.updateReceive(receiveDTO);
	}

	@Override
	public void deleteReceive(String rec_schedule_cd) {
		System.out.println("ReceiveServiceImpl deleteReceive()");
		
		receiveDAO.deleteReceive(rec_schedule_cd);
	}

	@Override
	public void updateStockcount(StockDTO stockDTO) {
		System.out.println("ReceiveServiceImpl updateStockcount()");
		
		receiveDAO.updateStockcount(stockDTO);
	}

	@Override
	public int getStock_count(String product_cd_name) {
		System.out.println("ReceiveServiceImpl getStock_count()");
		
		return receiveDAO.getStock_count(product_cd_name);
	}

	@Override
	public int getbfRec_count(String product_cd_name) {
		System.out.println("ReceiveServiceImpl getbfRec_count()");
		
		return receiveDAO.getbfRec_count(product_cd_name);
	}

	@Override
	public String getProduct_cd_name2(String rec_schedule_cd) {
		System.out.println("ReceiveServiceImpl getProduct_cd_name2()");
		
		return receiveDAO.getProduct_cd_name2(rec_schedule_cd);
	}

}