package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

public interface SystemService {

	public void memberinsertpro(SystemDTO systemDTO);
	
	public List<SystemDTO> getsystemlist(PageDTO pageDTO);
	
	public int getsystemcount();
}
