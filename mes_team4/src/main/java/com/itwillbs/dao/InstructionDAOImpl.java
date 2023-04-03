package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OMDTO;

import com.itwillbs.domain.PageDTO;

@Repository
public class InstructionDAOImpl implements InstructionDAO {
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.instructionMapper";

	@Override
	public List<OMDTO> getomlist(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl getomlist()");
		
		return sqlSession.selectList(namespace +"getomlist", pageDTO);
	}

	@Override
	public int getomcount(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl getomcount()");
		
		return sqlSession.selectOne(namespace + ".getomcount", pageDTO);
	}

	@Override
	public OMDTO ominfo(int order_cd) {
		System.out.println("InstructionDAOImpl ominfo()");
		
		return sqlSession.selectOne(namespace + ".ominfo", order_cd);
	}

	@Override
	public List<InstructionDTO> instructionList(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl instructionList()");
		
		return sqlSession.selectList(namespace + ".instructionList", pageDTO);
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
