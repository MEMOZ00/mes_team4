package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
			
			List<SystemDTO> orderList=orderService.getorderlist(pageDTO);
			
//			페이징처리
			int count = orderService.getsystemcount(pageDTO);
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
}
