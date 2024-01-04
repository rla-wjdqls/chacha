package kr.co.chacha.adopt;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.chacha.adopt.AdoptDTO;

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
	
	public List<AdoptDTO> adoptReview() {
		return sqlSession.selectList("adopt.adoptReview");
	}
	public AdoptDTO detail(int arno){
		return sqlSession.selectOne("adopt.detail", arno);
	}
	
	
}
