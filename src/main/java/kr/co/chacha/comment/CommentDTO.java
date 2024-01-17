package kr.co.chacha.comment;

public class CommentDTO {
	
	private int commentNo;
	private String content;
	private String uid;
	private String commentDate;
	private int textno;
	
	public CommentDTO() {}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public int getTextno() {
		return textno;
	}

	public void setTextno(int textno) {
		this.textno = textno;
	}

	@Override
	public String toString() {
		return "CommentDTO [commentNo=" + commentNo + ", content=" + content + ", uid=" + uid + ", commentDate="
				+ commentDate + ", textno=" + textno + "]";
	}
	
	
}
