package kr.co.chacha.center;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CenterDAO {
	
	public CenterDAO() {
		System.out.println("-----CenterDAO() 객체 생성");
	}
	
	//자동 생성된 객체를 가져와서 연결
	@Autowired
	SqlSession sqlSession;
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("center.insert", map);
	}//insert() end
	
	
	public List<Map<String, Object>> form(){
		return sqlSession.selectList("center.form");
	}
	
	public Map<String, Object> detail (String anino){
		return sqlSession.selectOne("center.detail", anino);
	}
	
	
	
}
