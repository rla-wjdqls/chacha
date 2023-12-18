package kr.co.chacha.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	public MemberDAO() {
		System.out.println("----MemberDAO()객체 생성");
	}//end
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	
	
	
	
	
	
}//end
