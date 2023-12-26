package kr.co.chacha.jjim;

public class JjimDTO {
	
	private String anino;
	private String uid;
	
	//생성자 
	public JjimDTO() {}

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

	@Override
	public String toString() {
		return "JjimDTO [anino=" + anino + ", uid=" + uid + "]";
	}
	
	
}
