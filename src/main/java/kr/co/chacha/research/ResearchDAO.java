package kr.co.chacha.research;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

@Repository
public class ResearchDAO {

	
	public ResearchDAO() {
		System.out.println("----ResearchDAO()객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	
}//class end
