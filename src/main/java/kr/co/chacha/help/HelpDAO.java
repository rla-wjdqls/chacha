package kr.co.chacha.help;

import java.util.List;

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
	
	public int helpIns(HelpDTO help) {
		return sqlSession.insert("help.insert", help);
	}//insert() end
	
	public List<HelpDTO> helpList(int textno) {
		return sqlSession.selectList("help.list", textno);
	}//list() end
	
	public int helpUpdate(HelpDTO help) {
		return sqlSession.update("help.update", help);
	}//update() end
	
	public int helpDelete(int textno) throws Exception {
		return sqlSession.delete("help.delete", textno);
	}//Delete() end
	

}//end
