package kr.co.chacha.jjim;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JjimDAO {
	
	public JjimDAO() {
		System.out.println("----JjimDAO() 객체 생성");
	}
	
	@Autowired
	SqlSession sqlSession;

	public int jjimInsert(JjimDTO dto) {
		return sqlSession.insert("jjim.insert", dto);
	}
}
