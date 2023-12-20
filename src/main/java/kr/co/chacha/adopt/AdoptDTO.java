package kr.co.chacha.adopt;

public class AdoptDTO {

	private int arno;		//후기글번호
	private String anino;	//동물번호
	private String uid;		//아이디
	private String artitle;	//제목
	private String arinfo;	//내용
	private String ardate;	//등록날짜
	private String arimg;	//파일명
	private int love;		//좋아요
	private int cnt;		//조회수
	private int comno;		//후기댓글번호
	private String adcm;	//댓글내용
	private String acdate;	//댓글날짜

	public AdoptDTO() {}

	public int getArno() {
		return arno;
	}

	public void setArno(int arno) {
		this.arno = arno;
	}

	public String getAnino() {
		return anino;
	}

	public void setAnino(String anino) {
		this.anino = anino;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getArtitle() {
		return artitle;
	}

	public void setArtitle(String artitle) {
		this.artitle = artitle;
	}

	public String getArinfo() {
		return arinfo;
	}

	public void setArinfo(String arinfo) {
		this.arinfo = arinfo;
	}

	public String getArdate() {
		return ardate;
	}

	public void setArdate(String ardate) {
		this.ardate = ardate;
	}

	public String getArimg() {
		return arimg;
	}

	public void setArimg(String arimg) {
		this.arimg = arimg;
	}

	public int getLove() {
		return love;
	}

	public void setLove(int love) {
		this.love = love;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getComno() {
		return comno;
	}

	public void setComno(int comno) {
		this.comno = comno;
	}

	public String getAdcm() {
		return adcm;
	}

	public void setAdcm(String adcm) {
		this.adcm = adcm;
	}

	public String getAcdate() {
		return acdate;
	}

	public void setAcdate(String acdate) {
		this.acdate = acdate;
	}

	@Override
	public String toString() {
		return "AdoptDTO [arno=" + arno + ", anino=" + anino + ", uid=" + uid + ", artitle=" + artitle + ", arinfo="
				+ arinfo + ", ardate=" + ardate + ", arimg=" + arimg + ", love=" + love + ", cnt=" + cnt + ", comno="
				+ comno + ", adcm=" + adcm + ", acdate=" + acdate + "]";
	}
	
	
	
}
