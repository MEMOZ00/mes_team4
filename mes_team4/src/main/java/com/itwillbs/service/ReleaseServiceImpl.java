package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReleaseDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReleaseDTO;

@Service
public class ReleaseServiceImpl implements ReleaseService{
	
	@Inject
	private ReleaseDAO releaseDAO;

	@Override
	public List<ReleaseDTO> getRelList(PageDTO pageDTO) {
		System.out.println("ReleaseServiceImpl getRelList()");
		//시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			return releaseDAO.getRelList(pageDTO);
	}

	@Override
	public int getRelCount(PageDTO pageDTO) {
		System.out.println("ReleaseServiceImpl getRelList()");
		
		return releaseDAO.getRelCount(pageDTO);
	}

	@Override
	public void insertrel(ReleaseDTO releaseDTO) {
		System.out.println("ReleaseServiceImpl insertrel()");
		
		if(releaseDAO.getRNum()==null) {
			//출고품목 없음
			releaseDTO.setRel_schedule_cd(releaseDTO.getRel_date()+"_R001");
		}else{
			//출고품목 => max(num)+1
			int num = releaseDAO.getRNum()+1;
			String str = releaseDTO.getRel_date() + "_R00" + num;
			System.out.println(releaseDTO.getRel_date() + "_R00" + num);
			releaseDTO.setRel_schedule_cd(str);
		}
		
		releaseDAO.insertrel(releaseDTO);
	}

	@Override
	public List<Map<String, Object>> getInstMap() {
		System.out.println("ReleaseServiceImpl getInstMap()");
		return releaseDAO.getInstMap();
	}

	

	

}
