package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

public interface InstructionDAO {

	public List<OrderDTO> getorderlist(PageDTO pageDTO);

	public int getordercount(PageDTO pageDTO);

	public OrderDTO orderinfo(String order_cd);

	public List<InstructionDTO> instructionlist(PageDTO pageDTO);

	public int getinstructioncount(PageDTO pageDTO);

	public void instructioninsertpro(InstructionDTO instructionDTO);

	public InstructionDTO instructioninfo(String instruction_code);

	public void instructiondelete(String instruction_code);

	public void instructionupdatepro(InstructionDTO instructionDTO);

	




}
