package com.itwillbs.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.OrderDAO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

@Service
public class OrderServiceImpl implements OrderService{
	@Inject
	private OrderDAO orderDAO;

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

//	@Override
//	public OrderDTO orderinfo(int instruction_cd) {
//		System.out.println("OrderServiceImpl orderinfo()");
//		
//		return orderDAO.orderinfo(instruction_cd);
//	}

	@Override
	public void orderinsertpro(OrderDTO orderDTO) {
		System.out.println("OrderServiceImpl orderinsertpro()");
		int num = 1;
		if(orderDTO.getInstruction_cd()== null) {
			//게시판 글 없음 = num =1
			orderDTO.setInstruction_cd("I" + orderDTO.getOrder_cd() + "_" + num);
		}else {
			//게시판 글 있음 MaxNum()+1
			orderDTO.setInstruction_cd("I" + orderDTO.getOrder_cd() + "_" + "num+1");
		}
	
		orderDAO.orderinsertpro(orderDTO);
		
	}
	
	
	
	
}
