package kr.co.chacha.servicea;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServiceaDAO {

	public ServiceaDAO() {
		System.out.println("----ServiceaDAO()객체 생성");
	}//end
	
	@Autowired
	SqlSession sqlSession;
}//end
