package kr.co.chacha.mypage;

import java.util.Date;

public class MypageDTO {

	//내 강의실
    private int myno;
    private String uid;
    private String eduno;
    private String mycon;
    private Date mydate;
    private String mystate;
    private Date mycomple;
    
    //봉사신청내역
    private int sano;
    private int sno;
    private Date sadate;
    private String stime;
    private String astate;
    
    
    
    
    //생성자 함수
	public MypageDTO() {}


	//getter, setter
	public int getMyno() {
		return myno;
	}


	public void setMyno(int myno) {
		this.myno = myno;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getEduno() {
		return eduno;
	}


	public void setEduno(String eduno) {
		this.eduno = eduno;
	}


	public String getMycon() {
		return mycon;
	}


	public void setMycon(String mycon) {
		this.mycon = mycon;
	}


	public Date getMydate() {
		return mydate;
	}


	public void setMydate(Date mydate) {
		this.mydate = mydate;
	}


	public String getMystate() {
		return mystate;
	}


	public void setMystate(String mystate) {
		this.mystate = mystate;
	}


	public Date getMycomple() {
		return mycomple;
	}


	public void setMycomple(Date mycomple) {
		this.mycomple = mycomple;
	}


	public int getSano() {
		return sano;
	}


	public void setSano(int sano) {
		this.sano = sano;
	}


	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public Date getSadate() {
		return sadate;
	}


	public void setSadate(Date sadate) {
		this.sadate = sadate;
	}


	public String getStime() {
		return stime;
	}


	public void setStime(String stime) {
		this.stime = stime;
	}


	public String getAstate() {
		return astate;
	}


	public void setAstate(String astate) {
		this.astate = astate;
	}


	//toString

	
	
	
	
	
	
	
	
	
	
	
	
}// end
