package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class InstructionDAOImpl implements InstructionDAO {
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.instructionMapper";

	@Override
	public List<OrderDTO> getorderlist(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl getorderlist()");
		
		return sqlSession.selectList(namespace +"getorderlist", pageDTO);
	}

	@Override
	public int getordercount(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl getordercount()");
		
		return sqlSession.selectOne(namespace + ".getordercount", pageDTO);
	}

	@Override
	public OrderDTO orderinfo(String order_cd) {
		System.out.println("InstructionDAOImpl orderinfo()");
		
		return sqlSession.selectOne(namespace + ".orderinfo", order_cd);
	}

	@Override
	public List<InstructionDTO> instructionlist(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl instructionlist()");
		
		return sqlSession.selectList(namespace + ".instructionlist", pageDTO);
	}

	@Override
	public int getinstructioncount(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl getinstructioncount()");
		
		return sqlSession.selectOne(namespace + ".getinstructioncount", pageDTO);
	}

	@Override
	public void instructioninsertpro(InstructionDTO instructionDTO) {
		System.out.println("InstructionDAOImpl instructioninsertpro()");
		
		sqlSession.insert(namespace + ".instructioninsertpro", instructionDTO);
		
	}

	@Override
	public InstructionDTO instructioninfo(String instruction_code) {
		System.out.println("InstructionDAOImpl instructioninfo()");
		
		return sqlSession.selectOne(namespace + ".instructioninfo", instruction_code);
	}

	@Override
	public void instructiondelete(String instruction_code) {
		System.out.println("InstructionDAOImpl instructiondelete()");
		
		sqlSession.delete(namespace + ".instructiondelete", instruction_code);
		
	}

	@Override
	public void instructionupdatepro(InstructionDTO instructionDTO) {
		System.out.println("InstructionDAOImpl instructionupdatepro()");
		
		sqlSession.update(namespace + ".instructionupdatepro", instructionDTO);
		
	}

	
}
