package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

public interface OrderService {

	List<SystemDTO> getorderlist(PageDTO pageDTO);

	public int getsystemcount(PageDTO pageDTO);

}
