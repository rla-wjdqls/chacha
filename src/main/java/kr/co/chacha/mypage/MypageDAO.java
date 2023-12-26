package kr.co.chacha.mypage;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.servlet.http.HttpSession;

@Repository
public class MypageDAO {
	
	public MypageDAO() {
		System.out.println("----MypageDAO() 객체 생성");
	}//MypageDAO() end
	
	
@Autowired
SqlSession sqlSession;
	

	public List<MypageDTO> myeduList(String s_id) {		
		return sqlSession.selectList("mypage.myeduList", s_id);
	}//myeduList() end
	
	public List<MypageDTO> myHelp(String s_id) {		
		return sqlSession.selectList("mypage.myHelp", s_id);
	}//myHelp() end
	
	public List<MypageDTO> myAdoprv(String s_id) {		
		return sqlSession.selectList("mypage.myAdoprv", s_id);
	}//myAdoprvList() end

	
	public List<MypageDTO> mysvList(String s_id) {		
		return sqlSession.selectList("mypage.mysvList", s_id);
	}//mvsList() end
	
	
	public List<MypageDTO> jjimList(String s_id) {		
		return sqlSession.selectList("mypage.jjimList", s_id);
	}//jjimList() end
	
	
	public List<MypageDTO> myComment(String s_id) {		
		return sqlSession.selectList("mypage.myComment", s_id);
	}//mvsList() end
	
	public List<MypageDTO> myAdopt(String s_id) {		
		return sqlSession.selectList("mypage.myAdopt", s_id);
	}//mvsList() end
	
	//비밀번호 확인
	public int checkPasswd(String passwd) {
		return sqlSession.selectOne("mypage.checkPasswd", passwd);
	}//findID() end
	
	
	//비밀번호 확인 후 탈퇴
	public void memberWithdraw(String s_id) {
		sqlSession.selectOne("mypage.memberWithdraw", s_id);
	}//memberWithdra() end
	
	
	//세션 아이디 회원정보 불러오기
	public List<MypageDTO> myInfoCheck(String s_id) {
		return sqlSession.selectList("mypage.myInfoCheck", s_id);
	}//myInfoCheck() end
	
	
	
}//end













