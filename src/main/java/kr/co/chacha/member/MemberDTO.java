package kr.co.chacha.member;

import java.sql.Date;

public class MemberDTO {

	//멤버 
    private String uid; 
    private int myno;
    private int sano;
    private String uname;
    private String email;
    private String passwd;
    private String zipcode;
    private String addr1;
    private String addr2;
    private String tel;
    private String birth;
    private Date mdate;
    private String mlevel;
    
    
    //소셜멤버
	private String s_email;
	private String s_uname;
	private String s_tel;
	private String s_birth;
	private String s_mlevel;
    
    
    //소셜로그인 
    private String sid;
    private String ptype;
    private String token;
    private String semail;
    
    
    //생성자 함수
	public MemberDTO() {}

	
	//getter,setter 함수
	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public int getMyno() {
		return myno;
	}


	public void setMyno(int myno) {
		this.myno = myno;
	}


	public int getSano() {
		return sano;
	}


	public void setSano(int sano) {
		this.sano = sano;
	}


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getAddr1() {
		return addr1;
	}


	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}


	public String getAddr2() {
		return addr2;
	}


	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public Date getMdate() {
		return mdate;
	}


	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}


	public String getMlevel() {
		return mlevel;
	}


	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}


	public String getSid() {
		return sid;
	}


	public void setSid(String sid) {
		this.sid = sid;
	}


	public String getPtype() {
		return ptype;
	}


	public void setPtype(String ptype) {
		this.ptype = ptype;
	}


	public String getToken() {
		return token;
	}


	public void setToken(String token) {
		this.token = token;
	}


	public String getSemail() {
		return semail;
	}


	public void setSemail(String semail) {
		this.semail = semail;
	}

	

	public String getS_email() {
		return s_email;
	}


	public void setS_email(String s_email) {
		this.s_email = s_email;
	}


	public String getS_uname() {
		return s_uname;
	}


	public void setS_uname(String s_uname) {
		this.s_uname = s_uname;
	}


	public String getS_tel() {
		return s_tel;
	}


	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}


	public String getS_birth() {
		return s_birth;
	}


	public void setS_birth(String s_birth) {
		this.s_birth = s_birth;
	}


	public String getS_mlevel() {
		return s_mlevel;
	}


	public void setS_mlevel(String s_mlevel) {
		this.s_mlevel = s_mlevel;
	}



	
	

	
	
  
	
	
	
	
}//end
