package kr.co.chacha.help;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import kr.co.chacha.help.HelpDTO;



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
	
	public List<HelpDTO> helpList(int currentPage, int limit, String type, String keyword) {
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HelpDTO dto = new HelpDTO();
		if(!StringUtils.isEmpty(type) && !StringUtils.isEmpty(keyword)) {
			dto.setType(type);
			dto.setKeyword(keyword);
		}
		return sqlSession.selectList("help.helpList", dto, rowBounds);
	}
	
	public int helpListCnt() {
		return sqlSession.selectOne("help.helpListCnt");
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
	
	//조회수
	public void increaseViewCount(int textno) {
	    // 게시물 조회수 증가 로직 구현
	    // 예: 데이터베이스에서 해당 sno의 게시물을 찾아 조회수를 1 증가시키는 쿼리 실행
		 sqlSession.update("help.increaseViewCount", textno);
	}
	
	//댓글
	 @Autowired
	    private SqlSessionTemplate sqlSessionTemplate;

	 public List<HelpDTO> getAllComments() {
	    return sqlSessionTemplate.selectList("help.getAllComments");
	    
	    }
	
	/*
	//댓글 // CommentDAO.java
	// HelpDAO.java
	public interface HelpDAO {
	    List<HelpDTO> getAllComments();
	    void addComment(HelpDTO comment);
	}

	// HelpDAOImpl.java
	public class HelpDAOImpl implements HelpDAO {
	    private SqlSession sqlSession;

	    public HelpDAOImpl(SqlSession sqlSession) {
	        this.sqlSession = sqlSession;
	    }

	    @Override
	    public List<HelpDTO> getAllComments() {
	        return sqlSession.selectList("help.helpDetail");
	    }

	    @Override
	    public void addComment(HelpDTO comment) {
	        sqlSession.insert("help.addComment", comment);
	    }
	}

	// CommentService.java
	public interface CommentService {
	    List<HelpDTO> getAllComments();
	    void addComment(String comment);
	}

	// CommentServiceImpl.java
	public class CommentServiceImpl implements CommentService {
	    private HelpDAO helpDAO;

	 // 생성자를 통한 의존성 주입
	    public CommentServiceImpl(HelpDAO helpDAO) {
	        this.helpDAO = helpDAO;
	    }

	    // 게터, 세터 등 필요한 메소드 추가

	    @Override
	    public List<HelpDTO> getAllComments() {
	        return helpDAO.getAllComments();
	    }

	    @Override
	    public void addComment(String commentText) {
	        HelpDTO comment = new HelpDTO();
	        comment.setComment(commentText);
	        helpDAO.addComment(comment);
	    }
	}
	*/	
		
		

}//end

