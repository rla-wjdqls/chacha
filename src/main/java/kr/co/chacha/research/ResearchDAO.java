package kr.co.chacha.research;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public void researchqInsertm(ResearchDTO researchDTO) {		
		sqlSession.insert("research.researchqInsertm", researchDTO);
	}//researchqInsert() end
	
	public void researchcInsert(ResearchDTO researchDTO) {		
		sqlSession.insert("research.researchcInsert", researchDTO);
	}//researchcInsert() end
	
	public int checkQno(ResearchDTO researchDTO) {		
		return sqlSession.selectOne("research.checkQno", researchDTO);
	}//researchcInsert() end
	
	public List<ResearchDTO> loadContent(String rno){
		return sqlSession.selectList("research.loadContent",rno);
	}//loadContent() end
	
	
	
	
	
	
	
}//class end






