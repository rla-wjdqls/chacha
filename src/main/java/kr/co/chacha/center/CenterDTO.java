package kr.co.chacha.center;

import java.util.Date;

public class CenterDTO {
	
	//동물 (글)
	private String anino; //동물번호
    private String uid;	  //회원번
    private String aname; //종류
    private String age;		//나이 
    private String gender;  //성별
    private String weight;	//몸무
    private String genop;	//중성화여부
    private String intro;	//특징
    private String anipic;	//사진
    private String noticeSdt; // 공고 시작
    private String noticeEdt; // 공고 끝
    private String happenPlace; // 발견장소
    private String careNm; // 보호센터
    private String careTel; // 전화번호
    private String colorCd; // 색상
    private String adopt; //상태
    private String adopt_pos;
    
    //입양신청
    private String apno; //신청번
    private String sub_cont; //신청내용
    private String sub_state; //신청상태
    private Date sub_date; //신청날짜
    private String subpic; //신청파일
    
    //생성자 함수 
    public CenterDTO() {}

    
    //getter/setter
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

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getGenop() {
		return genop;
	}

	public void setGenop(String genop) {
		this.genop = genop;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getAnipic() {
		return anipic;
	}

	public void setAnipic(String anipic) {
		this.anipic = anipic;
	}

	public String getAdopt_pos() {
		return adopt_pos;
	}

	public void setAdopt_pos(String adopt_pos) {
		this.adopt_pos = adopt_pos;
	}
	
	
	public String getApno() {
		return apno;
	}


	public void setApno(String apno) {
		this.apno = apno;
	}


	public String getSub_cont() {
		return sub_cont;
	}


	public void setSub_cont(String sub_cont) {
		this.sub_cont = sub_cont;
	}


	public String getSub_state() {
		return sub_state;
	}


	public void setSub_state(String sub_state) {
		this.sub_state = sub_state;
	}


	public Date getSub_date() {
		return sub_date;
	}


	public void setSub_date(Date sub_date) {
		this.sub_date = sub_date;
	}


	public String getSubpic() {
		return subpic;
	}

	public void setSubpic(String subpic) {
		this.subpic = subpic;
	}

	public String getNoticeSdt() {
		return noticeSdt;
	}


	public void setNoticeSdt(String noticeSdt) {
		this.noticeSdt = noticeSdt;
	}


	public String getNoticeEdt() {
		return noticeEdt;
	}


	public void setNoticeEdt(String noticeEdt) {
		this.noticeEdt = noticeEdt;
	}


	public String getHappenPlace() {
		return happenPlace;
	}


	public void setHappenPlace(String happenPlace) {
		this.happenPlace = happenPlace;
	}


	public String getCareNm() {
		return careNm;
	}


	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}


	public String getCareTel() {
		return careTel;
	}


	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}


	public String getColorCd() {
		return colorCd;
	}


	public void setColorCd(String colorCd) {
		this.colorCd = colorCd;
	}

	

	public String getAdopt() {
		return adopt;
	}


	public void setAdopt(String adopt) {
		this.adopt = adopt;
	}


	@Override
	public String toString() {
		return "CenterDTO [anino=" + anino + ", uid=" + uid + ", aname=" + aname + ", age=" + age + ", gender=" + gender
				+ ", weight=" + weight + ", genop=" + genop + ", intro=" + intro + ", anipic=" + anipic + ", noticeSdt="
				+ noticeSdt + ", noticeEdt=" + noticeEdt + ", happenPlace=" + happenPlace + ", careNm=" + careNm
				+ ", careTel=" + careTel + ", colorCd=" + colorCd + ", adopt=" + adopt + ", adopt_pos=" + adopt_pos
				+ ", apno=" + apno + ", sub_cont=" + sub_cont + ", sub_state=" + sub_state + ", sub_date=" + sub_date
				+ ", subpic=" + subpic + "]";
	}


	


	


}
