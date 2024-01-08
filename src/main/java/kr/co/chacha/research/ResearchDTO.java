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
	 //private List<String> qcont;
	 //private List<String> qtype;
	 private String[] qcont;
	 private String[] qtype;
	 //private String qcont;
	 //private String qtype;
	 
	 //선택지
	 private int cno;
	 //private String choice;
	 private String[] choice;
	//private List<String> choice;

	 //객관식 질문
	 private int rpno_g;
	 private String uid;
	 private int reply_g;
	 private Date rpdate_g;

	 //주관식 질문
	 private int rpno_j;
	 private String reply_j;
	 private Date rpdate_j;
	 
	 
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
	
	
	
	
	
	
//	
//	public String[] getQcont() {
//		return qcont;
//	}
//	public void setQcont(String[] qcont) {
//		this.qcont = qcont;
//	}
//	public String[] getQtype() {
//		return qtype;
//	}
//	public void setQtype(String[] qtype) {
//		this.qtype = qtype;
//	}
//	
//	public String[] getChoice() {
//		return choice;
//	}
//	public void setChoice(String[] choice) {
//		this.choice = choice;
//	}
	
//	public String getQcont() {
//		return qcont;
//	}
//	public void setQcont(String qcont) {
//		this.qcont = qcont;
//	}
//	public String getQtype() {
//		return qtype;
//	}
//	public void setQtype(String qtype) {
//		this.qtype = qtype;
//	}
//	
//	public String getChoice() {
//		return choice;
//	}
//	public void setChoice(String choice) {
//		this.choice = choice;
//	}
	



	public String[] getQcont() {
		return qcont;
	}


	public void setQcont(String[] qcont) {
		this.qcont = qcont;
	}


	public String[] getQtype() {
		return qtype;
	}


	public void setQtype(String[] qtype) {
		this.qtype = qtype;
	}


	public String[] getChoice() {
		return choice;
	}


	public void setChoice(String[] choice) {
		this.choice = choice;
	}


	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getRpno_g() {
		return rpno_g;
	}
	public void setRpno_g(int rpno_g) {
		this.rpno_g = rpno_g;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getReply_g() {
		return reply_g;
	}
	public void setReply_g(int reply_g) {
		this.reply_g = reply_g;
	}
	public Date getRpdate_g() {
		return rpdate_g;
	}
	public void setRpdate_g(Date rpdate_g) {
		this.rpdate_g = rpdate_g;
	}
	public int getRpno_j() {
		return rpno_j;
	}
	public void setRpno_j(int rpno_j) {
		this.rpno_j = rpno_j;
	}
	public String getReply_j() {
		return reply_j;
	}
	public void setReply_j(String reply_j) {
		this.reply_j = reply_j;
	}
	public Date getRpdate_j() {
		return rpdate_j;
	}
	public void setRpdate_j(Date rpdate_j) {
		this.rpdate_j = rpdate_j;
	}


	@Override
	public String toString() {
		return "ResearchDTO [rno=" + rno + ", rtitle=" + rtitle + ", rdate1=" + rdate1 + ", rdate2=" + rdate2
				+ ", rstate=" + rstate + ", rop=" + rop + ", rgdate=" + rgdate + ", qno=" + qno + ", qcont="
				+ Arrays.toString(qcont) + ", qtype=" + Arrays.toString(qtype) + ", cno=" + cno + ", choice="
				+ Arrays.toString(choice) + ", rpno_g=" + rpno_g + ", uid=" + uid + ", reply_g=" + reply_g
				+ ", rpdate_g=" + rpdate_g + ", rpno_j=" + rpno_j + ", reply_j=" + reply_j + ", rpdate_j=" + rpdate_j
				+ "]";
	}


	


	




	




	




	 
	 
	 
	 
	 
	 
	
}//end
