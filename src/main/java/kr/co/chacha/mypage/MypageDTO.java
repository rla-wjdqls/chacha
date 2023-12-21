package kr.co.chacha.mypage;

import java.util.Date;

public class MypageDTO {

	//내 강의실
    private int myno;
    private String uid;
    private String eduno;
    private String mycon;
    private Date mydate;
    private String mystate;
    private Date mycomple;
    
    //봉사신청내역
    private int sano;
    private int sno;
    private Date sadate;
    private String stime;
    private String astate;
    
    //찜목록
    private String jjim_icon;
    
    //입양동물
    private String anino;
    private String aname;
    private int age;
    private String gender;
    private String weight;
    private String genop;
    private String vac;
    private String intro;
    private String anipic;
    private String adopt;
    private String cnt;
    private String adopt_pos;
    
    
    //후기글
    private int arno;
    private String artitle;
    private String arinfo;
    private Date ardate;
    private String arimg;
    private int love;
    
    //후기댓글 
    private int comno;
    private String adcm;
    private Date acdate;
    
    
    //입양신청
    private String apno;
    private String sub_cont;
    private String sub_state;
    private Date sub_date;
    private String subpic;
    
    
    
    
    
    //생성자 함수
	public MypageDTO() {}


	//getter, setter
	public int getMyno() {
		return myno;
	}


	public void setMyno(int myno) {
		this.myno = myno;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getEduno() {
		return eduno;
	}


	public void setEduno(String eduno) {
		this.eduno = eduno;
	}


	public String getMycon() {
		return mycon;
	}


	public void setMycon(String mycon) {
		this.mycon = mycon;
	}


	public Date getMydate() {
		return mydate;
	}


	public void setMydate(Date mydate) {
		this.mydate = mydate;
	}


	public String getMystate() {
		return mystate;
	}


	public void setMystate(String mystate) {
		this.mystate = mystate;
	}


	public Date getMycomple() {
		return mycomple;
	}


	public void setMycomple(Date mycomple) {
		this.mycomple = mycomple;
	}


	public int getSano() {
		return sano;
	}


	public void setSano(int sano) {
		this.sano = sano;
	}


	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
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


	public String getJjim_icon() {
		return jjim_icon;
	}


	public void setJjim_icon(String jjim_icon) {
		this.jjim_icon = jjim_icon;
	}


	public String getAnino() {
		return anino;
	}


	public void setAnino(String anino) {
		this.anino = anino;
	}


	public String getAname() {
		return aname;
	}


	public void setAname(String aname) {
		this.aname = aname;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
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


	public String getVac() {
		return vac;
	}


	public void setVac(String vac) {
		this.vac = vac;
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


	public String getAdopt() {
		return adopt;
	}


	public void setAdopt(String adopt) {
		this.adopt = adopt;
	}


	public String getCnt() {
		return cnt;
	}


	public void setCnt(String cnt) {
		this.cnt = cnt;
	}


	public String getAdopt_pos() {
		return adopt_pos;
	}


	public void setAdopt_pos(String adopt_pos) {
		this.adopt_pos = adopt_pos;
	}


	public int getArno() {
		return arno;
	}


	public void setArno(int arno) {
		this.arno = arno;
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


	public Date getArdate() {
		return ardate;
	}


	public void setArdate(Date ardate) {
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


	public Date getAcdate() {
		return acdate;
	}


	public void setAcdate(Date acdate) {
		this.acdate = acdate;
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
	
	
	
	
	
	


	//toString

	
	
	
	
	
	
	
	
	
	
	
	
}// end
