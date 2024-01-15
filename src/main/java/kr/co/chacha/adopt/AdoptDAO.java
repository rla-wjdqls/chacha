package kr.co.chacha.adopt;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import kr.co.chacha.adopt.AdoptDTO;
import kr.co.chacha.help.HelpDTO;

@Repository
public class AdoptDAO {

	public AdoptDAO() {
		System.out.println("-----AdoptDAO() 객체 생성");
	}
	
	@Autowired
	SqlSession sqlSession;
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("adopt.insert", map);
	}
	
	public List<AdoptDTO> adoptReview(int currentPage, int limit, String type, String keyword) {
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		AdoptDTO dto = new AdoptDTO();
		if(!StringUtils.isEmpty(type) && !StringUtils.isEmpty(keyword)) {
			dto.setType(type);
			dto.setKeyword(keyword);
		}
		return sqlSession.selectList("adopt.adoptReview", dto, rowBounds);
	}
	
	public int adoptReviewCnt() {
		return sqlSession.selectOne("adopt.adoptReviewCnt");
	}
	
	public AdoptDTO detail(int arno){
		return sqlSession.selectOne("adopt.detail", arno);
	}
	
	public AdoptDTO delete(int arno){
		return sqlSession.selectOne("adopt.delete", arno);
	}
	public AdoptDTO update(AdoptDTO adoptdto){
		return sqlSession.selectOne("adopt.update", adoptdto);
	}
	
	//조회수
	public void increaseViewCount(int arno) {
	    // 게시물 조회수 증가 로직 구현
	    // 예: 데이터베이스에서 해당 sno의 게시물을 찾아 조회수를 1 증가시키는 쿼리 실행
		 sqlSession.update("adopt.increaseViewCount", arno);
	}
	
}
