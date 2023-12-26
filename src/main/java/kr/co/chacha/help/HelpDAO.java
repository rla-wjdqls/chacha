package kr.co.chacha.help;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.chacha.service.ServiceDTO;

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
	
	public int helpUpdate(HelpDTO help) {
		return sqlSession.update("help.update", help);
	}//update() end
	
	public int helpDelete(int textno) throws Exception {
		return sqlSession.delete("help.delete", textno);
	}//Delete() end
	

	public void insert(Map<String, Object> map) {
		sqlSession.insert("help.insert", map);
	}//insert() end
	
	public List<Map<String, Object>> form(){
		return sqlSession.selectList("help.list");
	}
	
	public List<HelpDTO> helpList2() {
		return sqlSession.selectList("help.helpList2");
		    }
	
	public HelpDTO detail(int textno){
		return sqlSession.selectOne("help.detail", textno);
	}
	

}//end

