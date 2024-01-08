package kr.co.chacha.research;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.checkerframework.checker.units.qual.m;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public class ResearchDAO {

	
	public ResearchDAO() {
		System.out.println("----ResearchDAO()객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public void researchInsert(ResearchDTO researchDTO) {		
		sqlSession.insert("research.researchInsert", researchDTO);
	}//researchInsert() end

	//질문 등록
	public void researchqInsert(List<ResearchDTO> researchList) {		
		sqlSession.insert("research.researchqInsert", researchList);
	}//researchqInsert() end
	
	
	public int checkQno(ResearchDTO researchDTO) {		
		return sqlSession.selectOne("research.checkQno", researchDTO);
	}//researchcInsert() end
	
	
	//설문조사 목록
	public List<ResearchDTO> researchList(){
		return sqlSession.selectList("research.researchCheck");
	}//researchList() end

	
	//설문조사 목록
	public ResearchDTO researchList2(String rno){
		return sqlSession.selectOne("research.researchCheck2", rno);
	}//researchList2() end
	
	
	//설문조사 질문 가져오기
	public ResearchDTO researchForm(String rno){
		//System.out.println(rno); //r20240107131903
		return sqlSession.selectOne("research.researchForm", rno);
	}//researchList() end
	
	//설문조사 선택지 가져오기
	public List<ResearchDTO> researchChoice(String rno){
		//System.out.println(rno); //r20240107131903
		return sqlSession.selectList("research.researchForm", rno);
	}//researchChoice() end
	
	
	
}//class end






