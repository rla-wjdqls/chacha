package kr.co.chacha.mypage;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.servlet.http.HttpSession;
import kr.co.chacha.jjim.JjimDTO;
import kr.co.chacha.member.MemberDTO;

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
	
	//회원 교육신청 내역(파트너)
	public List<MypageDTO> memeduList() {		
		return sqlSession.selectList("mypage.memeduList");
	}//myeduList() end
	
	
	public List<MypageDTO> myHelp(String s_id) {		
		return sqlSession.selectList("mypage.myHelp", s_id);
	}//myHelp() end
	
	public List<MypageDTO> myAdoprv(String s_id) {		
		return sqlSession.selectList("mypage.myAdoprv", s_id);
	}//myAdoprvList() end

	//봉사신청내역
	public List<MypageDTO> mysvList(String s_id) {		
		return sqlSession.selectList("mypage.mysvList", s_id);
	}//mvsList() end
	
	//봉사신청내역
	public List<MypageDTO> myService(String s_id) {		
		return sqlSession.selectList("mypage.myService", s_id);
	}//mvsList() end
	
	
	//회원 봉사신청내역(파트너)
	public List<MypageDTO> memserviceList() {		
		return sqlSession.selectList("mypage.memberService");
	}//mvsList() end
	
	
	public List<MypageDTO> jjimList(String s_id) {		
		return sqlSession.selectList("mypage.jjimList", s_id);
	}//jjimList() end
	
	
	public int jjimDelete(MypageDTO mypagedto) {
		return sqlSession.delete("jjim.jjimDelete", mypagedto);
	}
	
	
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
	
	
	//세션 아이디 회원정보 불러오기 (상세보기)
	public MypageDTO myInfoCheck(String s_id) {
		//System.out.println(s_id);
		return sqlSession.selectOne("mypage.myInfoCheck", s_id);
	}//myInfoCheck() end
	
	
	//회원정보 수정
	public void memberModify(MypageDTO mypagedto) {
		//System.out.println(mypagedto.getPasswd());
		sqlSession.update("mypage.memberModify", mypagedto);
	}//memberWithdra() end
	
	
	//찜리스트 삭제
	public void jjimDelete(String anino) {
		sqlSession.delete("mypage.jjimDelete", anino);
	}//memberWithdra() end
	
	
	
}//end













