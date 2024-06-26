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
	
	
	//로그인폼 전송
	public String loginProc(MemberDTO memberdto) {
		return sqlSession.selectOne("member.check", memberdto);
	}//loginProc() end
	
	
	//아이디 중복 확인 
	public int idCheck(String uid) {
		return sqlSession.selectOne("member.idcheck", uid);
	}//idCheck() end
	
	//이메일 중복 확인
	public int emailCheck(String email) {
		return sqlSession.selectOne("member.emailcheck", email);
	}//emailCheck() end
	
	//회원가입 폼 전송
	public int memberInsert(MemberDTO memberdto) {
		return sqlSession.insert("member.insert", memberdto);
	}//loginInsert() end
	
	
	//아이디 찾기
	public String findID(MemberDTO memberdto) {
		return sqlSession.selectOne("member.findID", memberdto);
	}//findID() end

	
	//비밀번호 찾기
	public String findPasswd(MemberDTO memberdto) {
		return sqlSession.selectOne("member.findPasswd", memberdto);
	}//findID() end
	
	
	//네이버로그인 등급 확인
	public String naverCheck(MemberDTO memberdto) {
		return sqlSession.selectOne("member.naverCheck", memberdto);
	}//loginInsert() end
	
	//네이버로그인 처음 이용 시 등록
	public void naverInsert(MemberDTO memberdto) {
		sqlSession.insert("member.naverInsert", memberdto);
	}//loginInsert() end
	
	//카카오로그인 등급 확인
	public String kakaoCheck(MemberDTO memberdto) {
		return sqlSession.selectOne("member.kakaoCheck", memberdto);
	}//loginInsert() end
	
	//카카오로그인 처음 이용 시 등록
	public void kakaoInsert(MemberDTO memberdto) {
		sqlSession.insert("member.kakaoInsert", memberdto);
	}//loginInsert() end
	
	
	
}//end





























