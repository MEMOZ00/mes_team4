
package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.InstructionService;

@Controller
public class InstructionController {
	@Inject
	private InstructionService instructionService;
	
	@RequestMapping(value = "/instruction/instructionmain", method = RequestMethod.GET)
	public String instructionmain(HttpServletRequest request, Model model) {
			System.out.println("InstructionController instructionmain()");
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
			
			List<InstructionDTO> instructionList=instructionService.instructionlist(pageDTO);
			
//			페이징처리
			int count = instructionService.getinstructioncount(pageDTO);
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
			
			
			
			model.addAttribute("instructionList", instructionList);
			model.addAttribute("pageDTO", pageDTO);
			
			return "instruction/InstructionMain";

	}
	
	@RequestMapping(value = "/instruction/instructioninsertform", method = RequestMethod.GET)
	public String instructioninsertform(HttpServletRequest request, Model model) {
			System.out.println("InstructionController instructioninsertform()");
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
			
			List<OrderDTO> orderList=instructionService.getorderlist(pageDTO);
			
//			페이징처리
			int count = instructionService.getordercount(pageDTO);
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
			
			return "instruction/InstructionInsertForm";

	}
	
	
	
	@RequestMapping(value = "/instruction/instructioninsert", method = RequestMethod.GET)
	public String instructioninsert(HttpServletRequest request, Model model) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("InstructionController instructioninsert()");
		String order_cd = request.getParameter("order_cd");
		OrderDTO orderDTO = instructionService.orderinfo(order_cd);
		model.addAttribute("orderDTO", orderDTO);

		return "instruction/InstructionInsert";
	}
	
	@RequestMapping(value = "/instruction/instructioninsertpro", method = RequestMethod.POST)
	public String instructioninsertpro(InstructionDTO instructionDTO) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("InstructionController instructioninsertpro()");
		String order_cd = instructionDTO.getOrder_cd();
		
		
		// MemberService memberService = new MemberServiceImpl();
		instructionService.instructioninsertpro(instructionDTO);
		
		// 가상주소에서 주소변경 하면서 이동
		return "redirect:/instruction/instructionmain";
	}
	
	@RequestMapping(value = "/instruction/instructionupdate", method = RequestMethod.GET)
	public String instructionupdate(HttpServletRequest request, Model model) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("InstructionController instructionupdate()");
		String instruction_code = request.getParameter("instruction_code");
		InstructionDTO instructionDTO = instructionService.instructioninfo(instruction_code);
		model.addAttribute("instructionDTO", instructionDTO);
		System.out.println(instructionDTO.getInstruction_date());
		return "/instruction/InstructionUpdate";
	}

	@RequestMapping(value = "/instruction/instructiondelete", method = RequestMethod.GET)
	public String instructiondelete(HttpServletRequest request) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("InstructionController instructiondelete()");
		String instruction_code = request.getParameter("instruction_code");
		instructionService.instructiondelete(instruction_code);

		 return "redirect:/instruction/instructionmain";
	}
	
	@RequestMapping(value = "/instruction/instructionupdatepro", method = RequestMethod.POST)
	public String instructionupdatepro(InstructionDTO instructionDTO) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("InstructionController instructionupdatepro()");

		instructionService.instructionupdatepro(instructionDTO);
		
		// 가상주소에서 주소변경 하면서 이동
		return "redirect:/instruction/instructionmain";
	}

	
}
