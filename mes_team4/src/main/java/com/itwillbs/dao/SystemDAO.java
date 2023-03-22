package com.itwillbs.dao;

import com.itwillbs.domain.SystemDTO;

public interface SystemDAO {

	public void memberinsertpro(SystemDTO systemDTO);
	
	public Integer getMaxEmp_no();
}
