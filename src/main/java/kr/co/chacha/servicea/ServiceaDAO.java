package kr.co.chacha.servicea;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.errorprone.annotations.OverridingMethodsMustInvokeSuper;

import kr.co.chacha.service.ServiceDTO;

@Repository
public class ServiceaDAO {

	public ServiceaDAO() {
		System.out.println("----ServiceaDAO()객체 생성");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public void insert(ServiceaDTO serviceadto) {
		sqlSession.insert("servicea.insert", serviceadto);
	}//insert() end
	
	public List<ServiceaDTO> serviceaList() {
		return sqlSession.selectList("servicea.serviceaList");
	}
	
	public ServiceaDTO detail(int sno){
		return sqlSession.selectOne("servicea.detail", sno);
	}
	
	public ServiceaDTO update(ServiceaDTO serviceadto){
		return sqlSession.selectOne("servicea.update", serviceadto);
	}
	
	public ServiceaDTO delete(int sno){
		return sqlSession.selectOne("servicea.delete", sno);
	}

}//end
