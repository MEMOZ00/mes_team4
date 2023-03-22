package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.SystemDTO;
import com.itwillbs.service.SystemService;

@Controller
public class SystemController {
	@Inject
	private SystemService systemService;
	
	@RequestMapping(value = "/system/membermain", method = RequestMethod.GET)
	public String membermain() {
		// 처리작업
		
		// 가상주소에서 주소변경 없이 이동
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
	
	
	
}
