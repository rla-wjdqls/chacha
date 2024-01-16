package kr.co.chacha.iamport;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class iamportAPI {
	
	@Value("${imp.api.key}")
	private String API_KEY;
	
	@Value("${imp.api.secretkey}")
	private String SECRET_KEY;
	
	public iamportAPI() {}
	
	public String getApiKey() {
		return API_KEY;
	} // getApiKey() ends 
	
	public String getApiSecret() {
		return SECRET_KEY;
	} // getApiSecret() ends 

}
