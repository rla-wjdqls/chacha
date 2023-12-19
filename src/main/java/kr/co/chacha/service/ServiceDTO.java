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
	 
		public ServiceDTO () {}

		public int getSno() {
			return sno;
		}

		public void setSno(int sno) {
			this.sno = sno;
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

		@Override
		public String toString() {
			return "ServiceDTO [sno=" + sno + ", uid=" + uid + ", stitle=" + stitle + ", sinfo=" + sinfo + ", ssdate="
					+ ssdate + ", sedate=" + sedate + ", time=" + time + ", sp=" + sp + ", splace=" + splace
					+ ", sstate=" + sstate + ", cnt=" + cnt + "]";
		}
		
		

}

