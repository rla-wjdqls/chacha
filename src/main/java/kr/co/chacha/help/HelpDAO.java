package kr.co.chacha.help;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;


public class HelpDAO {

	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;

	public HelpDAO() {
		dbopen = new DBOpen();
	}//end
	
	public int create(HelpDTO dto) {
		int cnt=0;
		try {
				con=dbopen.getConnection(); //DB연결
			
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
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//create() end
}
