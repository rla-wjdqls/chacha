package kr.co.chacha.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.errorprone.annotations.OverridingMethodsMustInvokeSuper;

@Repository
public class ServiceDAO {

	public ServiceDAO() {
		System.out.println("----ServiceDAO()객체 생성");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public void insert(ServiceDTO servicedto) {
		sqlSession.insert("service.insert", servicedto);
	}//insert() end
	
	//페이징
	public List<ServiceDTO> serviceList(int currentPage, int limit, ServiceDTO servicedto) {
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("service.serviceList", servicedto, rowBounds);
	}
	
	public int serviceListCnt() {
		return sqlSession.selectOne("service.serviceListCnt");
	}
	
	public ServiceDTO detail(int sno){
		return sqlSession.selectOne("service.detail", sno);
	}
	
	public ServiceDTO update(ServiceDTO servicedto){
		return sqlSession.selectOne("service.update", servicedto);
	}
	
	public ServiceDTO delete(int sno){
		return sqlSession.selectOne("service.delete", sno);
	}
	
	public void insertServicea(ServiceDTO servicedto) {
		sqlSession.insert("service.insertServicea", servicedto);
	}//insert() end
}//end
