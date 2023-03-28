package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.OMDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;
import com.itwillbs.service.OrderService;

@Controller
public class OrderController {
	@Inject
	private OrderService orderService;
	
	@RequestMapping(value = "/order/ordermain", method = RequestMethod.GET)
	public String ordermain(HttpServletRequest request, Model model) {
			System.out.println("OrderController ordermain()");
			String search =request.getParameter("search");
//			한 화면에 보여줄 글의 개수 설정
			int pageSize =10;
//			현재 페이지 번호 가져오기
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) {
//				pageNum이 없으면 1페이지로 설정
				pageNum = "1";
			} 
			int currentPage = Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setSearch(search);
			
			List<OrderDTO> orderList=orderService.getorderlist(pageDTO);
			
//			페이징처리
			int count = orderService.getordercount(pageDTO);
			int pageBlock = 10;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;  
			int endPage = startPage + pageBlock - 1;
			int pageCount = count/pageSize + (count%pageSize==0?0:1);
			if (endPage > pageCount){
				endPage = pageCount;
				}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("orderList", orderList);
			model.addAttribute("pageDTO", pageDTO);
			
			return "order/OrderMain";

	}
	
	@RequestMapping(value = "/order/orderinsertform", method = RequestMethod.GET)
	public String orderinsertform(HttpServletRequest request, Model model) {
			System.out.println("OrderController ordermain()");
			String search =request.getParameter("search");
//			한 화면에 보여줄 글의 개수 설정
			int pageSize =10;
//			현재 페이지 번호 가져오기
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) {
//				pageNum이 없으면 1페이지로 설정
				pageNum = "1";
			} 
			int currentPage = Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setSearch(search);
			
			List<OMDTO> omList=omService.getorderlist(pageDTO);
			
//			페이징처리
			int count = omService.getordercount(pageDTO);
			int pageBlock = 10;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;  
			int endPage = startPage + pageBlock - 1;
			int pageCount = count/pageSize + (count%pageSize==0?0:1);
			if (endPage > pageCount){
				endPage = pageCount;
				}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("omList", omList);
			model.addAttribute("pageDTO", pageDTO);
			
			return "order/OrderInsertForm";

	}
	
	
	
	@RequestMapping(value = "/order/orderinsert", method = RequestMethod.GET)
	public String memberupdate(HttpServletRequest request, Model model) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("OrderController memberupdate()");
		int order_cd = Integer.parseInt(request.getParameter("order_cd"));
		OMDTO omDTO = omService.orderinfo(order_cd);
		model.addAttribute("omDTO", omDTO);

		return "order/OrderInsert";
	}
	
	@RequestMapping(value = "/order/orderinsertpro", method = RequestMethod.POST)
	public String orderinsertpro(OrderDTO orderDTO) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("OrderController orderinsertpro()");
		
		
		// MemberService memberService = new MemberServiceImpl();
		orderService.orderinsertpro(orderDTO);
		
		// 가상주소에서 주소변경 하면서 이동
		return "redirect:/order/ordermain";
	}
	
	
	
}
