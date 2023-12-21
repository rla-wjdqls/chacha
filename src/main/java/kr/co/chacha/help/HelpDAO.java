package kr.co.chacha.help;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HelpDAO {
<<<<<<< HEAD

	//private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;

//	public HelpDAO() {
//		dbopen = new DBOpen();
//	}//end
	
	public int create(HelpDTO dto) {
		int cnt=0;
		try {
				//con=dbopen.getConnection(); //DB연결
			
				sql=new StringBuilder();
				sql.append(" INSERT INTO help(textno, uid, texttitle, text, uploaddate, helppic, love, cnt) ");
				sql.append(" VALUES (help_seq.nextval, ?, ?, ?, ?, ?, ?, (select nvl(max(textno), 0)+1 from help)) ");
				
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getTexttitle());
				pstmt.setString(2, dto.getText());
				pstmt.setString(3, dto.getHelppic());
				pstmt.setString(4, dto.getUid());
				pstmt.setString(5, dto.getUploaddate());
				
				cnt=pstmt.executeUpdate();
		
		}catch (Exception e) {
			System.out.println("추가실패: " + e);
		}finally {
			//DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//create() end
}
=======
	
	public HelpDAO() {
		System.out.println("-----HelpDAO() 객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<HelpDTO> helpList(int textno) {
		return sqlSession.selectList("help.list", textno);
	}//list() end
	
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
	

}//end
>>>>>>> 936b7adbba1acf8b0346d6a4c75dce15b84d54f6
