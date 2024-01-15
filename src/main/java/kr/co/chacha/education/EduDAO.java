package kr.co.chacha.education;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EduDAO {
	
	public EduDAO() {
		System.out.println("-----EduDAO() 객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> form(){
		return sqlSession.selectList("education.list");
	}
	
	public void eduIns(EduDTO edudto) {
		sqlSession.insert("education.insert", edudto);
	
	}//insert() end
	
	public EduDTO getLatestResult(String uid) {
        return sqlSession.selectOne("education.getLatestResult", uid);
    }
	
	
	
}//end
