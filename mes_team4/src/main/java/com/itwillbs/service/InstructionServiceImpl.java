package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.InstructionDAO;
import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class InstructionServiceImpl implements InstructionService{
	@Inject
	private InstructionDAO instructionDAO;

	@Override
	public List<OrderDTO> getorderlist(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl getorderlist()");
		
		return instructionDAO.getorderlist(pageDTO);
	}

	@Override
	public int getordercount(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl getordercount()");
		
		return instructionDAO.getordercount(pageDTO);
	}

	@Override
	public OrderDTO orderinfo(String order_cd) {
		System.out.println("InstructionServiceImpl orderinfo()");
		
		return instructionDAO.orderinfo(order_cd);
	}

	@Override
	public List<InstructionDTO> instructionlist(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl instructionlist()");

		return instructionDAO.instructionlist(pageDTO);
	}

	@Override
	public int getinstructioncount(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl getinstructioncount()");
		
		return instructionDAO.getinstructioncount(pageDTO);
	}

	@Override
	public void instructioninsertpro(InstructionDTO instructionDTO) {
		System.out.println("InstructionServiceImpl instructioninsertpro()");
		
		instructionDAO.instructioninsertpro(instructionDTO);
		
	}

	@Override
	public InstructionDTO instructioninfo(String instruction_code) {
		System.out.println("InstructionServiceImpl instructioninfo()");
		
		return instructionDAO.instructioninfo(instruction_code);
	}

	@Override
	public void instructiondelete(String instruction_code) {
		System.out.println("InstructionServiceImpl instructiondelete()");
		
		instructionDAO.instructiondelete(instruction_code);
		
	}

	@Override
	public void instructionupdatepro(InstructionDTO instructionDTO) {
		System.out.println("InstructionServiceImpl instructionupdatepro()");
		
		instructionDAO.instructionupdatepro(instructionDTO);
		
	}
	
	


	
}	

