package kr.co.chacha.servicea;

import java.sql.Date;

public class ServiceaDTO {
	 	private int sno;
		private String uid; 
		private int sano;
	 	private Date sadate;
	 	private String stime;
		private String astate;
		
		
		public ServiceaDTO () {}


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
			return "ServiceaDTO [sno=" + sno + ", uid=" + uid + ", sano=" + sano + ", sadate=" + sadate + ", stime="
					+ stime + ", astate=" + astate + "]";
		}
	

}