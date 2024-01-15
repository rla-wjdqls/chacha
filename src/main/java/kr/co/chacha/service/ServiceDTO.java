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
		
		//페이징
		private int limit = 10;
		private int offset = 0;
		
		//검색
		private String type;
		private String keyword;
		
		//인원체크
		private int currentParticipants;
	    private int maxParticipants;
	    
	    
		public int getCurrentParticipants() {
			return currentParticipants;
		}

		public void setCurrentParticipants(int currentParticipants) {
			this.currentParticipants = currentParticipants;
		}

		public int getMaxParticipants() {
			return maxParticipants;
		}

		public void setMaxParticipants(int maxParticipants) {
			this.maxParticipants = maxParticipants;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public String getKeyword() {
			return keyword;
		}

		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}

		public ServiceDTO () {}
		
		public String getSetime() {
			return setime;
		}


		public void setSetime(String setime) {
			this.setime = setime;
		}


		public int getLimit() {
			return limit;
		}


		public void setLimit(int limit) {
			this.limit = limit;
		}


		public int getOffset() {
			return offset;
		}


		public void setOffset(int offset) {
			this.offset = offset;
		}


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
					+ ", sstate=" + sstate + ", cnt=" + cnt + ", sstime=" + sstime + ", setime=" + setime + ", sano="
					+ sano + ", sadate=" + sadate + ", stime=" + stime + ", astate=" + astate + ", limit=" + limit
					+ ", offset=" + offset + ", type=" + type + ", keyword=" + keyword + ", currentParticipants="
					+ currentParticipants + ", maxParticipants=" + maxParticipants + "]";
		}
	
	

		

}

