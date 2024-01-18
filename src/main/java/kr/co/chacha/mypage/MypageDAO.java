package kr.co.chacha.mypage;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.oracle.wls.shaded.org.apache.xml.dtm.ref.CustomStringPool;

import jakarta.servlet.http.HttpSession;
import kr.co.chacha.jjim.JjimDTO;
import kr.co.chacha.member.MemberDTO;
import kr.co.chacha.service.ServiceDTO;

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
	
	public List<MypageDTO> myListc(String s_id) {		
		return sqlSession.selectList("mypage.myListc", s_id);
	}//myListc() end
	

	//봉사신청내역
	public List<MypageDTO> mysvList(String s_id) {		
		return sqlSession.selectList("mypage.mysvList", s_id);
	}//mvsList() end
	
	//봉사신청내역
	public List<MypageDTO> myService(String s_id) {		
		return sqlSession.selectList("mypage.myService", s_id);
	}//mvsList() end
	
	
	//봉사취소 
	public int srvDelete(MypageDTO mypagedto) {
		return sqlSession.delete("mypage.srvDelete", mypagedto);
	}
	
	
	//입양글 목록(관리자)
	public List<MypageDTO> myLista(String s_id) {		
		return sqlSession.selectList("mypage.myLista", s_id);
	}//mvsLista() end
	
	//내가 쓴 글수 - 목격제보
	public int helpPost(String s_id) {
		return sqlSession.selectOne("mypage.helpPost", s_id);
	}//helpPost() end
	
	//내가 쓴 글수 - 입양후기
	public int adoprvPost(String s_id) {
		return sqlSession.selectOne("mypage.adoprvPost", s_id);
	}//adoprvPost() end
	
	//내가 쓴 댓글수 
	public int commentCnt(String s_id) {
		return sqlSession.selectOne("mypage.commentCnt", s_id);
	}//commentCnt() end
	
	//회원 봉사신청내역(파트너)
	public List<MypageDTO> memserviceList() {		
		return sqlSession.selectList("mypage.memberService");
	}//mvsList() end
	
	
	public List<MypageDTO> jjimList(String s_id) {		
		return sqlSession.selectList("mypage.jjimList", s_id);
	}//jjimList() end
	
	
	public int jjimDelete(MypageDTO mypagedto) {
		return sqlSession.delete("mypage.jjimDelete", mypagedto);
	}
	
	public List<MypageDTO> myComment(String s_id) {		
		return sqlSession.selectList("mypage.myComment", s_id);
	}//mvsList() end
	
	//입양신청+결제 내역
	public List<MypageDTO> myAdopt(String s_id) {		
		return sqlSession.selectList("mypage.myAdopt", s_id);
	}//mvsList() end
	
	//입양신청 내역 조회
	public List<MypageDTO> myAdopt1(String s_id) {		
		return sqlSession.selectList("mypage.myAdopt1", s_id);
	}//mvsList() end
	
	//회원들 입양신청 내역
	public List<MypageDTO> memAdopt() {		
		return sqlSession.selectList("mypage.memAdopt");
	}//mvsList() end
	
	//회원등급 변경(관리자)
	public void updateMlevel(MypageDTO mypagedto) {
		//System.out.println(mypagedto.getUid());    //kim9595
		//System.out.println(mypagedto.getMlevel()); //c
		sqlSession.update("mypage.updateMlevel", mypagedto);
	}//updateMlevel() end
	
	//회원 입양신청상태 변경(관리자)
	public void updateSubstate(MypageDTO mypagedto) {
		//System.out.println(mypagedto.getSub_state()); //C
		//System.out.println(mypagedto);
		sqlSession.update("mypage.updateSubstate", mypagedto);
	}//updateSubstate() end
	
	//비밀번호 확인
	public int checkPasswd(String passwd) {
		return sqlSession.selectOne("mypage.checkPasswd", passwd);
	}//findID() end
	
	
	//일반회원 탈퇴
	public void memberWithdraw(String s_id) {
		sqlSession.update("mypage.memberWithdraw", s_id);
	}//memberWithdra() end
	
	//소셜로그인 멤버 탈퇴
	public void smemberWithdraw(String s_id) {
		sqlSession.update("mypage.smemberWithdraw", s_id);
	}//memberWithdra() end
	
	
	//세션 아이디 회원정보 불러오기 (상세보기)
	public MypageDTO myInfoCheck(String s_id) {
		//System.out.println(s_id);
		return sqlSession.selectOne("mypage.myInfoCheck", s_id);
	}//myInfoCheck() end
	
	//회원관리
	public List<MypageDTO> memList() {
		return sqlSession.selectList("mypage.memList");
	}//memList() end
	
	//소셜 회원관리
	public List<MypageDTO> smemList() {
		return sqlSession.selectList("mypage.smemList");
	}//smemList() end

	
	//회원정보 수정
	public void memberModify(MypageDTO mypagedto) {
		sqlSession.update("mypage.memberModify", mypagedto);
	}//memberWithdra() end
	
	
	//찜리스트 삭제
	public void jjimDelete(String anino) {
		sqlSession.delete("mypage.jjimDelete", anino);
	}//memberWithdra() end
	
	//결제 테이블 업데이트 
	public void payUpdate(String s_id) {
		sqlSession.update("mypage.payUpdate", s_id);
	}//memberWithdra() end
	
//	public void payUpdate(MypageDTO mypageDTO) {
//		sqlSession.update("mypage.payUpdate", mypageDTO);
//	}//memberWithdra() end
	
	//결제상태 환불로 변경
	public void updatePayop(String uid) {
		sqlSession.update("mypage.updatePayop", uid);
	}//updatePayop() end
	
	//입양신청 상태 업데이트 
	public void adoptUpdate(String s_id) {
		sqlSession.update("mypage.adoptUpdate", s_id);
	}//memberWithdra() end
	
	
	// 페이징,검색
	public List<MypageDTO> searchList(int currentPage, int limit, String type, String keyword, HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		
	    int offset = (currentPage - 1) * limit;
	    RowBounds rowBounds = new RowBounds(offset, limit);

	    MypageDTO mypagedto = new MypageDTO();
	    mypagedto.setUid(s_id); 

	    if (!StringUtils.isEmpty(type) && !StringUtils.isEmpty(keyword)) {
	        mypagedto.setType(type);
	        mypagedto.setKeyword(keyword);
	    }

	    return sqlSession.selectList("mypage.searchList", mypagedto, rowBounds);
	}

	public int searchListCnt(String uid, String type, String keyword, HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		
	    MypageDTO mypagedto = new MypageDTO();
	    mypagedto.setUid(s_id);

	    return sqlSession.selectOne("mypage.searchListCnt", mypagedto);
	}

	
	
}//end













