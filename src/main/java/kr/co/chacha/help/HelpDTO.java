package kr.co.chacha.help;

public class HelpDTO {

	private int textno;
	private String uid;
	private String texttitle;
	private String text;
	private String uploaddate;
	private String helppic;
	private int love;
	private int cnt;
	
	public HelpDTO() {}

	public int getTextno() {
		return textno;
	}

	public void setTextno(int textno) {
		this.textno = textno;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getTexttitle() {
		return texttitle;
	}

	public void setTexttitle(String texttitle) {
		this.texttitle = texttitle;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}

	public String getHelppic() {
		return helppic;
	}

	public void setHelppic(String helppic) {
		this.helppic = helppic;
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

	@Override
	public String toString() {
		return "HelpDTO [textno=" + textno + ", uid=" + uid + ", texttitle=" + texttitle + ", text=" + text
				+ ", uploaddate=" + uploaddate + ", helppic=" + helppic + ", love=" + love + ", cnt=" + cnt + "]";
	}
	
}
