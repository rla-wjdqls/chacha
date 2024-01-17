package kr.co.chacha.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {

	public CommentDAO() {
		System.out.println("-----CommentDAO 객체 생성");
	}
	
	@Autowired
	SqlSession sqlSession;
	
	public int commentInsert(CommentDTO comment) {
		return sqlSession.insert("comment.insert", comment);
	}//insert() end
	
	
	public List<CommentDTO> commentList(int textno){
		return sqlSession.selectList("comment.list", textno);
	}//list() end
	
	
	public int commentUpdate(CommentDTO comment) {
		return sqlSession.update("comment.update", comment);
	}//update() end
	
	public int commentDelete(int commentNo) throws Exception{
		return sqlSession.delete("comment.delete", commentNo);
	}//delete() end
}

