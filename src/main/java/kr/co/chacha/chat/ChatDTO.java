package kr.co.chacha.chat;

import java.util.Date;

public class ChatDTO {
	//채팅방 테이블
	private String uid; 	//회원 - 보내는 사람
	private String uid2;	//글작성자 아이디 
	private String anino;	//동물글번호
	private int textno;		//목격제보글번호
	private int roomno;		//채팅방번호 pk
	
	//채팅 테이블
	// uid;
	// roomno;
	private int mno;
	private String mcontent;
	private String sender_id; 	//보내는 사람
	private String receiver_id;	//받는 사람
	private Date sdate; 
	
	public ChatDTO() {}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUid2() {
		return uid2;
	}

	public void setUid2(String uid2) {
		this.uid2 = uid2;
	}

	public String getAnino() {
		return anino;
	}

	public void setAnino(String anino) {
		this.anino = anino;
	}

	public int getTextno() {
		return textno;
	}

	public void setTextno(int textno) {
		this.textno = textno;
	}

	public int getRoomno() {
		return roomno;
	}

	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	@Override
	public String toString() {
		return "ChatDTO [uid=" + uid + ", uid2=" + uid2 + ", anino=" + anino + ", textno=" + textno + ", roomno="
				+ roomno + ", mno=" + mno + ", mcontent=" + mcontent + ", sender_id=" + sender_id + ", receiver_id="
				+ receiver_id + ", sdate=" + sdate + "]";
	}

	
	
	
	
}
