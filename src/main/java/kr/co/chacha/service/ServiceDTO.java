package kr.co.chacha.service;

import java.sql.Date;

public class ServiceDTO {
	 	private int sno;
		private String uid; 
		private String stitle;
		private String sinfo;
		private Date ssdate;
		private Date sedate;
		private String time;
		private int sp;
		private String splace;
		private String sstate;
		private int cnt;
		private String sstime;
		private String setime;
	 
		private int sano;
	 	private Date sadate;
	 	private String stime;
		private String astate;
		
		
		public ServiceDTO () {}
		public int getSno() {
			return sno;
		}
		public void setSno(int sno) {
			this.sno = sno;
		}
		
		
		public String getSstime() {
			return sstime;
		}
		public void setSstime(String sstime) {
			this.sstime = sstime;
		}
		public String getEtime() {
			return setime;
		}
		public void setEtime(String setime) {
			this.setime = setime;
		}
		public String getUid() {
			return uid;
		}
		public void setUid(String uid) {
			this.uid = uid;
		}
		public String getStitle() {
			return stitle;
		}
		public void setStitle(String stitle) {
			this.stitle = stitle;
		}
		public String getSinfo() {
			return sinfo;
		}
		public void setSinfo(String sinfo) {
			this.sinfo = sinfo;
		}
		public Date getSsdate() {
			return ssdate;
		}
		public void setSsdate(Date ssdate) {
			this.ssdate = ssdate;
		}
		public Date getSedate() {
			return sedate;
		}
		public void setSedate(Date sedate) {
			this.sedate = sedate;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public int getSp() {
			return sp;
		}
		public void setSp(int sp) {
			this.sp = sp;
		}
		public String getSplace() {
			return splace;
		}
		public void setSplace(String splace) {
			this.splace = splace;
		}
		public String getSstate() {
			return sstate;
		}
		public void setSstate(String sstate) {
			this.sstate = sstate;
		}
		public int getCnt() {
			return cnt;
		}
		public void setCnt(int cnt) {
			this.cnt = cnt;
		}
		public int getSano() {
			return sano;
		}
		public void setSano(int sano) {
			this.sano = sano;
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
		@Override
		public String toString() {
			return "ServiceDTO [sno=" + sno + ", uid=" + uid + ", stitle=" + stitle + ", sinfo=" + sinfo + ", ssdate="
					+ ssdate + ", sedate=" + sedate + ", time=" + time + ", sp=" + sp + ", splace=" + splace
					+ ", sstate=" + sstate + ", cnt=" + cnt + ", sstime=" + sstime + ", etime=" + setime + ", sano="
					+ sano + ", sadate=" + sadate + ", stime=" + stime + ", astate=" + astate + ", getSno()=" + getSno()
					+ ", getSstime()=" + getSstime() + ", getEtime()=" + getEtime() + ", getUid()=" + getUid()
					+ ", getStitle()=" + getStitle() + ", getSinfo()=" + getSinfo() + ", getSsdate()=" + getSsdate()
					+ ", getSedate()=" + getSedate() + ", getTime()=" + getTime() + ", getSp()=" + getSp()
					+ ", getSplace()=" + getSplace() + ", getSstate()=" + getSstate() + ", getCnt()=" + getCnt()
					+ ", getSano()=" + getSano() + ", getSadate()=" + getSadate() + ", getStime()=" + getStime()
					+ ", getAstate()=" + getAstate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
					+ ", toString()=" + super.toString() + "]";
		}
	
	

		

}

