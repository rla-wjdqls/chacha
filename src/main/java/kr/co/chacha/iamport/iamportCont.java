package kr.co.chacha.iamport;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller
public class iamportCont {
	
	// 토큰 발급을 위해 아임포트에서 제공하는 rest api 사용 (의존성 추가 필요)
	private IamportClient iamportClient;
	private iamportAPI iamportApi; // key 값을 숨기기 위한 클래스 
	
	// 생성자 
	public iamportCont(@Autowired iamportAPI iamportApi) {
		
		this.iamportApi = iamportApi;
		String API_KEY = iamportApi.getApiKey();
		String SECRET_KEY = iamportApi.getApiSecret();
		
		this.iamportClient = new IamportClient(API_KEY, SECRET_KEY);
	} // constructor end

	// 결제 검증 
	@PostMapping("/payment/verify/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(@PathVariable(value="imp_uid") String imp_uid) throws IamportResponseException, IOException{
		return iamportClient.paymentByImpUid(imp_uid);
	} // paymentByImpUid() ends 
	
	// 토큰 얻기 
	@ResponseBody
	public String getToken() throws IOException {
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);

	    HttpsURLConnection conn = null;

	    URL url = new URL("https://api.iamport.kr/users/getToken");

	    conn = (HttpsURLConnection) url.openConnection();

	    conn.setRequestMethod("POST");
	    conn.setRequestProperty("Content-type", "application/json");
	    conn.setRequestProperty("Accept", "application/json");
	    conn.setDoOutput(true);
	    JsonObject json = new JsonObject();

	    json.addProperty("imp_key", iamportApi.getApiKey());
	    json.addProperty("imp_secret", iamportApi.getApiSecret());

	    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

	    bw.write(json.toString());
	    bw.flush();
	    bw.close();

	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

	    Gson gson = new Gson();

	    String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();

	    System.out.println(response);

	    String token = gson.fromJson(response, Map.class).get("access_token").toString();

	    br.close();
	    conn.disconnect();

	    System.out.println(token);

	    return token;
	}
 
	
}//class end
