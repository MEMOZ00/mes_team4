package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.itwillbs.dao.SystemDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

@Service
public class SystemServiceImpl implements SystemService{
	@Inject
	private SystemDAO systemDAO;

	@Override
	public void memberinsertpro(SystemDTO systemDTO) {
		System.out.println("SystemServiceImpl memberinsertpro()");
		if(systemDAO.getMaxEmp_no() == null) {
			//게시판 글 없음 = num =1
			systemDTO.setEmp_no(100000);
		}else {
			//게시판 글 있음 MaxNum()+1
			systemDTO.setEmp_no(systemDAO.getMaxEmp_no()+1);
		}
		
		systemDAO.memberinsertpro(systemDTO);
	}

	@Override
	public List<SystemDTO> getsystemlist(PageDTO pageDTO) {
		System.out.println("SystemServiceImpl getSystemList()");
		// 계산작업, 시작하는 행번호 구하기
		
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1 ;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return systemDAO.getsystemlist(pageDTO);
	}

	@Override
	public int getsystemcount() {
		System.out.println("SystemServiceImpl getsystemcount()");
		
		return systemDAO.getsystemcount();
	}
	
	
	
	
	
}
