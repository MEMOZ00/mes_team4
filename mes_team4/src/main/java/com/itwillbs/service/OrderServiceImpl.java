package com.itwillbs.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.OMDAO;
import com.itwillbs.dao.OrderDAO;
import com.itwillbs.domain.OMDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

@Service
public class OrderServiceImpl implements OrderService{
	@Inject
	private OrderDAO orderDAO;

	@Override
	public List<OMDTO> getomlist(PageDTO pageDTO) {
		System.out.println("OrderServiceImpl getorderlist()");
		
		return orderDAO.getomlist(pageDTO);
	}

	@Override
	public int getomcount(PageDTO pageDTO) {
		System.out.println("OrderServiceImpl getordercount()");
		
		return orderDAO.getomcount(pageDTO);
	}

	@Override
	public OMDTO ominfo(int order_cd) {
		System.out.println("OrderServiceImpl ominfo()");
		
		return orderDAO.ominfo(order_cd);
	}
	
	@Override
	public void orderinsertpro(OrderDTO orderDTO) {
		System.out.println("OrderServiceImpl orderinsertpro()");
		
			orderDTO.setInstruction_code("IC" + orderDTO.getOrder_cd());

		orderDAO.orderinsertpro(orderDTO);
		
	}

	@Override
	public OrderDTO orderinfo(String instruction_code) {
		System.out.println("OrderServiceImpl orderinfo()");
		
		return orderDAO.orderinfo(instruction_code);
	}

	@Override
	public void orderupdatepro(OrderDTO orderDTO) {
		System.out.println("OrderServiceImpl orderupdatepro()");
		
		orderDAO.orderupdatepro(orderDTO);
		
	}

	@Override
	public void orderdelete(String instruction_code) {
		System.out.println("OrderServiceImpl orderdelete()");
		
		orderDAO.orderdelete(instruction_code);
	}

	@Override
	public List<OrderDTO> getorderlist(PageDTO pageDTO) {
System.out.println("OrderServiceImpl getorderlist()");
		
		return orderDAO.getorderlist(pageDTO);
	}

	@Override
	public int getordercount(PageDTO pageDTO) {
System.out.println("OrderServiceImpl getordercount()");
		
		return orderDAO.getordercount(pageDTO);
	}


	
	
	
}	

