package kr.co.chacha.research;


import static org.hamcrest.CoreMatchers.nullValue;

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
	
	public int researchInsert(ResearchDTO researchDTO) {		
		return sqlSession.insert("research.researchInsert", researchDTO);
	}//researchInsert() end

	//질문 등록
	public int researchqInsert(List<ResearchDTO> researchList) {		
		return sqlSession.insert("research.researchqInsert", researchList);
	}//researchqInsert() end
	
	//선택지 등록
	public int researchcInsert(List<ResearchDTO> researchList) {		
		return sqlSession.insert("research.researchcInsert", researchList);
	}//researchqInsert() end
	
	public List<ResearchDTO> checkQno(String rno) {		
		return sqlSession.selectList("research.checkQno", rno);
	}//checkQno() end
	
	public int checkQty(String rno) {		
		return sqlSession.selectOne("research.checkQty", rno);
	}//checkQty() end
	
	
	//설문조사 목록
	public List<ResearchDTO> researchList(){
		return sqlSession.selectList("research.researchCheck");
	}//researchList() end

	
	//설문조사 목록
	public ResearchDTO researchList2(String rno){
		return sqlSession.selectOne("research.researchCheck2", rno);
	}//researchList2() end
	
	
	//설문조사 qno 가져오기
	public List<ResearchDTO> chekckQcont(String rno){
		return sqlSession.selectList("research.checkQcont", rno);
	}//researchForm() end
	
	
	//설문조사 질문 + 선택지 가져오기
	public List<ResearchDTO> researchrForm(String rno){
		//System.out.println(rno); //r20240107131903
		return sqlSession.selectList("research.researchrForm", rno);
	}//researchrForm() end
	
	
	
}//class end






