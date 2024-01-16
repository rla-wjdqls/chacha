package kr.co.chacha.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.google.errorprone.annotations.OverridingMethodsMustInvokeSuper;

import jakarta.servlet.jsp.jstl.sql.Result;

@Repository
public class ServiceDAO {

	public ServiceDAO() {
		System.out.println("----ServiceDAO()객체 생성");
	}// end

	@Autowired
	SqlSession sqlSession;

	public void insert(ServiceDTO servicedto) {
		sqlSession.insert("service.insert", servicedto);
	}// insert() end

	// 페이징,검색
	public List<ServiceDTO> serviceList(int currentPage, int limit, String type, String keyword) {
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		ServiceDTO dto = new ServiceDTO();
		if (!StringUtils.isEmpty(type) && !StringUtils.isEmpty(keyword)) {
			dto.setType(type);
			dto.setKeyword(keyword);
		}
		return sqlSession.selectList("service.serviceList", dto, rowBounds);
	}

	public int serviceListCnt() {
		return sqlSession.selectOne("service.serviceListCnt");
	}

	public ServiceDTO detail(int sno) {
		return sqlSession.selectOne("service.detail", sno);
	}

	public ServiceDTO update(ServiceDTO servicedto) {
		return sqlSession.selectOne("service.update", servicedto);
	}

	public ServiceDTO delete(int sno) {
		return sqlSession.selectOne("service.delete", sno);
	}

	public void insertServicea(ServiceDTO servicedto) {
		sqlSession.insert("service.insertServicea", servicedto);
	}// insert() end

	// 조회수
	public void increaseViewCount(int sno) {
		// 게시물 조회수 증가 로직 구현
		// 예: 데이터베이스에서 해당 sno의 게시물을 찾아 조회수를 1 증가시키는 쿼리 실행
		sqlSession.update("service.increaseViewCount", sno);
	}

	public int checkPersonCnt(int sno) {
		return sqlSession.selectOne("service.checkPersonCnt", sno);
	}

}// end
