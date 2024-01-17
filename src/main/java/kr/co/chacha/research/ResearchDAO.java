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
	
	public int checkUser(ResearchDTO researchDTO) {		
		return sqlSession.selectOne("research.checkUser", researchDTO);
	}//checkQty() end
	
	public String checkMaxrno() {		
		return sqlSession.selectOne("research.checkMaxrno");
	}//checkMaxrno() end
	
	public int getQuestions(String rno) {		
		return sqlSession.selectOne("research.getQuestions", rno);
	}//getQuestions() end
	
	
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
	public List<ResearchDTO> researchrList(String rno){
		//System.out.println(rno); //r20240107131903
		return sqlSession.selectList("research.researchrList", rno);
	}//researchrForm() end
	
	
	//설문조사 답변 insert
	public int researchrInsert(ResearchDTO researchDTO){
		return sqlSession.insert("research.researchrInsert", researchDTO);
	}//researchrInsert() end
	
	
	//설문조사 다중답변 insert
	public int researchrcInsert(List<ResearchDTO> researchList) {		
		return sqlSession.insert("research.researchrcInsert", researchList);
	}//researchrcInsert() end
	
	
	//설문조사 참여자 수 구하기
	public int countUid(String rno){
		return sqlSession.selectOne("research.countUid", rno);
	}//countUid() end
	
	//설문조사 결과 가져오기
	public List<ResearchDTO> checkResult(String rno){
		return sqlSession.selectList("research.checkResult", rno);
	}//researchrForm() end
	
	//설문조사 수정하기
	public int researchModify(ResearchDTO researchdto) {
		return sqlSession.update("research.researchModify", researchdto);
	}//researchModify() end
	
	//설문조사 삭제하기
	public int researchDelete(String rno) {
		return sqlSession.delete("research.researchDelete", rno);
	}//researchDelete()end
	
	
	//설문기한 종료에 따른 조사 상태 변경
	public int updateRstate(ResearchDTO researchdto) {
		return sqlSession.update("research.updateRstate", researchdto);
	}//researchModify() end
	
}//class end



























