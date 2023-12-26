package kr.co.chacha;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ChachaApplication.class);
	}//main() end
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory factory) {

	System.out.println("-----sqlSession() 호출됨");

	return new SqlSessionTemplate(factory);

	}//sqlSession() end


}
