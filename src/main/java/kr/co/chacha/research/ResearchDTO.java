package kr.co.chacha.research;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

public class ResearchDTO {

	//설문
	 private String rno;
	 private String rtitle;
	 private Date rdate1;
	 private Date rdate2;
	 private String rstate;
	 private String rop;
	 private Date rgdate;

	 //질문
	 private int qno;
	 private String qcont;
	 private String qtype;
	 private String qty;
	 
	 //선택지
	 private int cno;
	 private String choice;


	 //질문
	 private int rpno;
	 private String uid;
	 private int reply;
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
	public String getRop() {
		return rop;
	}
	public void setRop(String rop) {
		this.rop = rop;
	}
	public Date getRgdate() {
		return rgdate;
	}
	public void setRgdate(Date rgdate) {
		this.rgdate = rgdate;
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


	public String getQtype() {
		return qtype;
	}


	public void setQtype(String qtype) {
		this.qtype = qtype;
	}


	public String getChoice() {
		return choice;
	}


	public void setChoice(String choice) {
		this.choice = choice;
	}


	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}
	

	public int getRpno() {
		return rpno;
	}

	public void setRpno(int rpno) {
		this.rpno = rpno;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public Date getRpdate() {
		return rpdate;
	}

	public void setRpdate(Date rpdate) {
		this.rpdate = rpdate;
	}


	@Override
	public String toString() {
		return "rno=" + rno + ", qno=" + qno + ", qcont=" + qcont + ", uid=" + uid
				+ ", cno=" + cno + ", choice=" + choice + ", reply=" + reply ;
	}





	



	 
	 
	 
	 
	 
	 
	
}//end
