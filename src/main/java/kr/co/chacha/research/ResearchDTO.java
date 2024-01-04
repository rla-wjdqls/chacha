package kr.co.chacha.research;

import java.util.Date;

public class ResearchDTO {

	//설문
	private String rno;
	private String rtitle;
	private Date rdate1;	
	private Date rdate2;
	private String rstate;

	//질문
	private int qno;
	private String qcont;

	//선택지
	private int cno;
	private String choice;

	//답변
	private int rpno;
	private String uid;	
	private String reply;
	private Date rpdate;
	
	
	public ResearchDTO() {}


	public String getRno() {
		return rno;
	}


	public void setRno(String rno) {
		this.rno = rno;
	}


	public String getRtitle() {
		return rtitle;
	}


	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}


	public Date getRdate1() {
		return rdate1;
	}


	public void setRdate1(Date rdate1) {
		this.rdate1 = rdate1;
	}


	public Date getRdate2() {
		return rdate2;
	}


	public void setRdate2(Date rdate2) {
		this.rdate2 = rdate2;
	}


	public String getRstate() {
		return rstate;
	}


	public void setRstate(String rstate) {
		this.rstate = rstate;
	}


	public int getQno() {
		return qno;
	}


	public void setQno(int qno) {
		this.qno = qno;
	}


	public String getQcont() {
		return qcont;
	}


	public void setQcont(String qcont) {
		this.qcont = qcont;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public String getChoice() {
		return choice;
	}


	public void setChoice(String choice) {
		this.choice = choice;
	}


	public int getRpno() {
		return rpno;
	}


	public void setRpno(int rpno) {
		this.rpno = rpno;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getReply() {
		return reply;
	}


	public void setReply(String reply) {
		this.reply = reply;
	}


	public Date getRpdate() {
		return rpdate;
	}


	public void setRpdate(Date rpdate) {
		this.rpdate = rpdate;
	}
	

	
	
	
}//end
