package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

public interface OrderDAO {

	List<OrderDTO> getorderlist(PageDTO pageDTO);

	public int getordercount(PageDTO pageDTO);

//	public OrderDTO orderinfo(int instruction_cd);

	public void orderinsertpro(OrderDTO orderDTO);



}
