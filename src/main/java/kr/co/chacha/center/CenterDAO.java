package kr.co.chacha.center;

import java.util.HashMap;
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
	
	
	public List<CenterDTO> form(int page, int size){
		int offset = (page - 1) * size;
	    
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("offset", offset);
	    parameterMap.put("size", size);
	    
		return sqlSession.selectList("center.form", parameterMap);
	}
	
	public List<CenterDTO> randomList(){
		return sqlSession.selectList("randomList");
	}
	
	public Map<String, Object> detail (String anino){
		return sqlSession.selectOne("center.detail", anino);
	}
	
	public int update (Map<String, Object> map){
		return sqlSession.update("center.update", map);
	}
	
	public String anipic(String anino) {
		return sqlSession.selectOne("center.anipic", anino);
	}
	
	public void delete(String anino) {
		sqlSession.delete("center.delete", anino);
	}
	
//	public int check(String uid, String str) {
//		Map<String, Object> params = new HashMap<>();
//	    params.put("uid", uid);
//	    params.put("str", str);
//	    return sqlSession.selectOne("center.check", params);
//		
//	}
	
}
