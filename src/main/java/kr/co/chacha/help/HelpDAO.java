package kr.co.chacha.help;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class HelpDAO {
	
	public HelpDAO() {
		System.out.println("-----HelpDAO() 객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	//public List<HelpDTO> helpList(int textno) {
	//	return sqlSession.selectList("help.list", textno);
	//}//list() end
	
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("help.insert", map);
	}//insert() end
	
	public List<Map<String, Object>> form(){
		return sqlSession.selectList("help.list");
	}
	
	/* public void insert(HelpDTO helpdto) {
		sqlSession.insert("help.insert", helpdto);
	} */
	
	public List<HelpDTO> helpList() {
		return sqlSession.selectList("help.helpList");
	}
	
	public HelpDTO detail(int textno){
		return sqlSession.selectOne("help.detail", textno);
	}
	
	public HelpDTO update(HelpDTO helpdto){
		return sqlSession.selectOne("help.update", helpdto);
	}
	
	public HelpDTO delete(int textno){
		return sqlSession.selectOne("help.delete", textno);
	}

}//end

