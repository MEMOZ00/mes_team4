package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.OMDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

public interface OrderDAO {

	List<OMDTO> getomlist(PageDTO pageDTO);

	public int getomcount(PageDTO pageDTO);

	public OMDTO ominfo(int order_cd);

	public void orderinsertpro(OrderDTO orderDTO);

	public OrderDTO orderinfo(String instruction_code);

	public void orderdelete(String instruction_code);

	List<OrderDTO> getorderlist(PageDTO pageDTO);

	int getordercount(PageDTO pageDTO);



}
