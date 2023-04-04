package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PerformDTO;
import com.itwillbs.service.InstructionService;
import com.itwillbs.service.PerformService;

@Controller
public class PerformController {
	
	//멤버변수 부모 인터페이스 정의 => 자동으로 자식 클래스 객체생성
		// 스프링 객체생성 방식 => 의존관계주입(DI : Dependency Injection)
		@Inject
		private PerformService performService;
		@Inject
		private InstructionService instructionService;
			
		@RequestMapping(value = "/perform/perform", method = RequestMethod.GET)
		public String perform(HttpServletRequest request, Model model) {
			System.out.println("PerformController perform()");
			//검색어 가져오기
			String search=request.getParameter("search");
			String select=request.getParameter("select");
			
			// 한 화면에 보여줄 글 개수 설정
			int pageSize=5;
			// 현페이지 번호 가져오기
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				//pageNum 없으면 1페이지 설정
				pageNum="1";
			}
			// 페이지번호를 => 정수형 변경
			int currentPage=Integer.parseInt(pageNum);
						
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			//검색어
			pageDTO.setSearch(search);
			pageDTO.setSelect(select);
			
//			List<PerformDTO> PerformList=performService.getPerformList(pageDTO);
						
			//메서드 호출
			List<Map<String, Object>> PerformMap
			     =performService.getPerformMap(pageDTO);
			
			//페이징 처리
			int count = performService.getPerformCount(pageDTO);
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			
			//model 담아서 이동
			model.addAttribute("PerformMap", PerformMap);
			
//			model.addAttribute("PerformList", PerformList);
			model.addAttribute("pageDTO", pageDTO);			
			
			// 주소변경 없이 이동
			// /WEB-INF/views/perform/Perform.jsp
			return "perform/Perform";
		}
		
		@RequestMapping(value = "/perform/performinsert", method = RequestMethod.GET)
		public String performInsert(HttpServletRequest request, Model model) {
			
			//메서드 호출
			List<Map<String, Object>> instMap
			     =performService.getInstMap();
			//model 담아서 이동
			model.addAttribute("instMap", instMap);
			
//			String instruction_code=request.getParameter("instruction_code");
//			String product_cd=request.getParameter("product_cd");
//			String line_cd=request.getParameter("line_cd");
			
//			model.addAttribute("instruction_code", instruction_code);
//			model.addAttribute("product_cd", product_cd);
//			model.addAttribute("line_cd", line_cd);
			
			// 주소변경 없이 이동
			// /WEB-INF/views/perform/PerformInsert.jsp
			return "perform/PerformInsert";
		}
		
		@RequestMapping(value = "/perform/performinsertpro", method = RequestMethod.POST)
		public String performInsertPro(HttpServletRequest request, PerformDTO performDTO) {
			System.out.println("PerformController performInsertPro()");
			if(performService.getPerformCount2()==0) {
				performDTO.setPerform_cd("MPF00001");
			}else {
				String maxpc=performService.getPerform_cd();
				maxpc=maxpc.substring(3);
				int tpc=Integer.parseInt(maxpc);
				tpc=tpc+1;
				maxpc=String.valueOf(tpc);
				if(maxpc.length()==1) {
				maxpc="0000".concat(maxpc);
				maxpc="MPF".concat(maxpc);
				}else if(maxpc.length()==2) {
					maxpc="000".concat(maxpc);
					maxpc="MPF".concat(maxpc);
				}else if(maxpc.length()==3) {
					maxpc="00".concat(maxpc);
					maxpc="MPF".concat(maxpc);
				}else if(maxpc.length()==4) {
					maxpc="0".concat(maxpc);
					maxpc="MPF".concat(maxpc);
				}else if(maxpc.length()==5) {
					maxpc="MPF".concat(maxpc);
				}
				performDTO.setPerform_cd(maxpc);
			}
			
			//글쓰기 작업 메서드 호출
			performService.insertPerform(performDTO);
			
			// 주소변경 하면서 이동
			return "redirect:/perform/perform";
		}
		
		@RequestMapping(value = "/perform/performupdate", method = RequestMethod.GET)
		public String performUpdate(HttpServletRequest request, Model model) {
			String perform_cd=request.getParameter("perform_cd");
//			PerformDTO performDTO=performService.getPerform(perform_cd);
			
			//메서드 호출
			List<Map<String, Object>> instMap
			     =performService.getInstMap();
			//model 담아서 이동
			model.addAttribute("instMap", instMap);
			
			//메서드 호출
			Map<String, Object> perform
			     =performService.getPerform(perform_cd);
			
			//model 담아서 이동
			model.addAttribute("perform", perform);
//			model.addAttribute("PerformDTO", performDTO);
//			System.out.println(perform.get("line_cd"));
			
			// 주소변경 없이 이동
			// /WEB-INF/views/perform/PerformUpdate.jsp
			return "perform/PerformUpdate";
		}
		
		@RequestMapping(value = "/perform/performupdatepro", method = RequestMethod.POST)
		public String performUpdatePro(PerformDTO performDTO) {
			
			performService.updatePerform(performDTO);
			
			// 주소변경 하면서 이동
			return "redirect:/perform/perform";
		}
		
		@RequestMapping(value = "/perform/performdelete", method = RequestMethod.GET)
		public String performDelete(HttpServletRequest request) {
			String chbox[]=request.getParameterValues("rowcheck");
			String perform_cd = null;
			if(chbox!=null){
				  for(int i=0;i<chbox.length;i++){
					perform_cd=chbox[i];
					performService.deletePerform(perform_cd);
				  }
		       }			
			
			// 주소변경 하면서 이동
			return "redirect:/perform/perform";
		}
		
			@ResponseBody
			@RequestMapping(value = "/perform/callcd", method = RequestMethod.GET)
			public String callcd(HttpServletRequest request, Model model) {
				// request 파라미터 
				String ic=request.getParameter("ic");
				
				// 메서드 호출
				Map<String, Object> callcdMap
				     =performService.getcallcdMap(ic);
												
				String result=(String) callcdMap.get("line_cd");
								
				return result;
			}
			
			@ResponseBody
			@RequestMapping(value = "/perform/callcd2", method = RequestMethod.GET)
			public String callcd2(HttpServletRequest request, Model model) {
				// request 파라미터 
				String ic=request.getParameter("ic");
				
				// 메서드 호출
				Map<String, Object> callcdMap
				     =performService.getcallcdMap(ic);
				
//				int a=(int) callcdMap.get("product_cd");
//				String result=Integer.toString(a);
				
				String result=(String) callcdMap.get("product_cd");
								
				return result;
			}
			
			@RequestMapping(value = "/perform/instlist", method = RequestMethod.GET)
			public String instList(HttpServletRequest request, Model model) {
				
//				한 화면에 보여줄 글의 개수 설정
				int pageSize =5;
//				현재 페이지 번호 가져오기
				String pageNum = request.getParameter("pageNum");
				if(pageNum == null) {
//					pageNum이 없으면 1페이지로 설정
					pageNum = "1";
				} 
				int currentPage = Integer.parseInt(pageNum);
				
				PageDTO pageDTO = new PageDTO();
				pageDTO.setPageSize(pageSize);
				pageDTO.setPageNum(pageNum);
				pageDTO.setCurrentPage(currentPage);
				
				List<InstructionDTO> instructionList=instructionService.instructionlist(pageDTO);
				
//				페이징처리
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
				
				// 주소변경 없이 이동
				// /WEB-INF/views/perform/InstList.jsp
				return "perform/InstList";
			}
			
}
