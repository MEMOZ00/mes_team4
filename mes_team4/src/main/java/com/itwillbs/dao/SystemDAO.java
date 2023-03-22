package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

public interface SystemDAO {

	public void memberinsertpro(SystemDTO systemDTO);
	
	public Integer getMaxEmp_no();
	
	public List<SystemDTO> getsystemlist(PageDTO pageDTO);
	
	public int getsystemcount();
	
	public SystemDTO memberinfo(int emp_no);
}
