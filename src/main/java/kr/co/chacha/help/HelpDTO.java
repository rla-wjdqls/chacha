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
	
	//댓글
	private String comment;
	
	//페이징
	private int limit = 10;
	private int offset = 0;
	
	private String type;
	private String keyword;
	
	public HelpDTO() {}
	
	
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

		
	
	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}

	
	
	

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
