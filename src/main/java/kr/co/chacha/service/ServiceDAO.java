package kr.co.chacha.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		    }//insert() end
}//end
