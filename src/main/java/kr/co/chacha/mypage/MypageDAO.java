package kr.co.chacha.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO {
	
	public MypageDAO() {
		System.out.println("----MypageDAO() 객체 생성");
	}//MypageDAO() end
	
	
@Autowired
SqlSession sqlSession;
	
/*	
	public MypageDTO myClassList() {
		return sqlSession.selectOne("mypage.myClassList");
	}//myClassList() end
*/	
	
	
	
	
	
	
}//end




