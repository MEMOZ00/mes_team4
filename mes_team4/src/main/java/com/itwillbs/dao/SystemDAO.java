package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

public interface SystemDAO {
	
	// 담당자이름 팝업 리스트 
	List<SystemDTO> getEnameList(PageDTO pageDTO);

	int getsystemcount();

}
