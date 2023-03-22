package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.SystemDAO;
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
	
	
	
	
}
