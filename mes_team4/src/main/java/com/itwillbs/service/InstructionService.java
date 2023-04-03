package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OMDTO;
import com.itwillbs.domain.PageDTO;


public interface InstructionService {
	
	public List<OMDTO> getomlist(PageDTO pageDTO);

	public int getomcount(PageDTO pageDTO);

	public OMDTO ominfo(int order_cd);

	public List<InstructionDTO> instructionList(PageDTO pageDTO);

	public int getinstructioncount(PageDTO pageDTO);

	public void instructioninsertpro(InstructionDTO instructionDTO);

	public InstructionDTO instructioninfo(String instruction_code);

	public void instructiondelete(String instruction_code);

	public void instructionupdatepro(InstructionDTO instructionDTO);

}
