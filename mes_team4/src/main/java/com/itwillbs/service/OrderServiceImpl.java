package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.OrderDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

@Service
public class OrderServiceImpl implements OrderService{
	@Inject
	private OrderDAO orderDAO;

	@Override
	public List<SystemDTO> getorderlist(PageDTO pageDTO) {
		System.out.println("OrderServiceImpl getorderlist()");
		
		return orderDAO.getorderlist(pageDTO);
	}

	@Override
	public int getsystemcount(PageDTO pageDTO) {
		System.out.println("OrderServiceImpl getsystemcount()");
		
		return orderDAO.getsystemcount(pageDTO);
	}
	
	
	
	
}
