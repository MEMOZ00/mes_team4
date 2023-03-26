package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

public interface OrderDAO {

	List<SystemDTO> getorderlist(PageDTO pageDTO);

	public int getsystemcount(PageDTO pageDTO);

}
