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
import com.itwillbs.service.SystemService;

@Controller
public class SystemController {
	@Inject
	private SystemService systemService;
	
	@RequestMapping(value = "/system/membermain", method = RequestMethod.GET)
	public String membermain(HttpServletRequest request, Model model) {
			System.out.println("SystemController membermain()");
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
			
			List<SystemDTO> systemList=systemService.getsystemlist(pageDTO);
			
//			페이징처리
			int count = systemService.getsystemcount();
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
			
			model.addAttribute("systemList", systemList);
			model.addAttribute("pageDTO", pageDTO);
			
			// /WEB-INF/views/board/list.jsp
			return "system/MemberMain";

	}
	
	@RequestMapping(value = "/system/memberinsert", method = RequestMethod.GET)
	public String memberinsert() {
		// 처리작업
		
		// 가상주소에서 주소변경 없이 이동
		return "system/MemberInsert";
	}
	
	@RequestMapping(value = "/system/memberinsertpro", method = RequestMethod.POST)
	public String memberinsertpro(SystemDTO systemDTO) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("SystemController memberinsertpro()");
		
		
		// MemberService memberService = new MemberServiceImpl();
		systemService.memberinsertpro(systemDTO);
		
		// 가상주소에서 주소변경 하면서 이동
		return "redirect:/system/membermain";
	}
	
	@RequestMapping(value = "/system/memberupdate", method = RequestMethod.POST)
	public String memberupdate(HttpServletRequest request, Model model) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("SystemController memberupdate()");
		int emp_no = Integer.parseInt(request.getParameter("emp_no")); 
		SystemDTO systemDTO = systemService.memberinfo(emp_no);
		model.addAttribute("systemDTO", systemDTO);
		// MemberService memberService = new MemberServiceImpl();
		
		
		// 가상주소에서 주소변경 하면서 이동
		return "system/MemberUpdate";
	}

}
