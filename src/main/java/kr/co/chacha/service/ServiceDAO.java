package kr.co.chacha.service;

import java.util.List;
import java.util.Map;

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
	
	public List<ServiceDTO> serviceList2() {
		return sqlSession.selectList("service.serviceList2");
		    }
	
	
	public ServiceDTO detail(int sno){
		return sqlSession.selectOne("service.detail", sno);
	}
	
	public ServiceDTO update(int sno){
		return sqlSession.selectOne("service.update", sno);
	}
	
	public ServiceDTO delete(int sno){
		return sqlSession.selectOne("service.delete", sno);
	}
}//end
