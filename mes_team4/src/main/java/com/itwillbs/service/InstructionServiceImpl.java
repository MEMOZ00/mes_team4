package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.InstructionDAO;
import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OMDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class InstructionServiceImpl implements InstructionService{
	@Inject
	private InstructionDAO instructionDAO;

	@Override
	public List<OMDTO> getomlist(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl getomlist()");
		
		return instructionDAO.getomlist(pageDTO);
	}

	@Override
	public int getomcount(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl getomcount()");
		
		return instructionDAO.getomcount(pageDTO);
	}

	@Override
	public OMDTO ominfo(int order_cd) {
		System.out.println("InstructionServiceImpl ominfo()");
		
		return instructionDAO.ominfo(order_cd);
	}

	@Override
	public List<InstructionDTO> instructionList(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl instructionList()");

		return instructionDAO.instructionList(pageDTO);
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

