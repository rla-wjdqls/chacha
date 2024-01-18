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
    
    
    //봉사글
    private String stitle;
    private String sinfo;
    private Date ssdate;
    private Date sedate;
    private String time;
    private int sp;
    private String splace;
    private String sstate;
    private int cnt_service;
    
    
    
    //봉사신청내역
    private int sano;
    private int sno;
    private Date sadate;
    private String stime;
    private String astate;
    
    //찜목록
    private int jjimno;
    
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
    private Date animal_date;
    
    
    //후기글
    private int arno;
    private String artitle;
    private String arinfo;
    private Date ardate;
    private String arimg;
    private int love;
    private int cnt_adoprv;
    
    
    //후기댓글 
    private int comno;
    private String adcm;
    private Date acdate;
    
    
    //목격제보
	private int textno;	
	private String texttitle;
	private String text;
	private Date uploaddate;
	private String helppic;
	private int cnt_help;
    
    
    //입양신청
    private String apno;
    private String sub_cont;
    private String sub_state;
    private Date sub_date;
    private String subpic;
    
    
    //결제
    private String payno;
    private String payop;
    private Date pdate;
    private String paymet;
    private String patamt;
    private String imp_uid;
    
    
	//멤버 
    private String uname;
    private String email;
    private String passwd;
    private String zipcode;
    private String addr1;
    private String addr2;
    private String tel;
    private String birth;
    private Date mdate;
    private String mlevel;
    
    //소셜멤버
    private String s_email;
    private String s_uname;
    private Date s_mdate;
 	private String s_mlevel;
    
	//페이징
	private int limit = 10;
	private int offset = 0;
	
	//검색
	private String type;
	private String keyword;
 	
    
    
    
    //생성자 함수
	public MypageDTO() {}


	//getter, setter
	
	
	
	public int getMyno() {
		return myno;
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


	public int getJjimno() {
		return jjimno;
	}


	public void setJjimno(int jjimno) {
		this.jjimno = jjimno;
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


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getAddr1() {
		return addr1;
	}


	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}


	public String getAddr2() {
		return addr2;
	}


	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public Date getMdate() {
		return mdate;
	}


	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}


	public String getMlevel() {
		return mlevel;
	}


	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}


	public int getCnt_adoprv() {
		return cnt_adoprv;
	}


	public void setCnt_adoprv(int cnt_adoprv) {
		this.cnt_adoprv = cnt_adoprv;
	}


	public int getTextno() {
		return textno;
	}


	public void setTextno(int textno) {
		this.textno = textno;
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


	public Date getUploaddate() {
		return uploaddate;
	}


	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}


	public String getHelppic() {
		return helppic;
	}


	public void setHelppic(String helppic) {
		this.helppic = helppic;
	}


	public int getCnt_help() {
		return cnt_help;
	}


	public void setCnt_help(int cnt_help) {
		this.cnt_help = cnt_help;
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


	public int getCnt_service() {
		return cnt_service;
	}


	public void setCnt_service(int cnt_service) {
		this.cnt_service = cnt_service;
	}


	public String getPayno() {
		return payno;
	}


	public void setPayno(String payno) {
		this.payno = payno;
	}


	public String getPayop() {
		return payop;
	}


	public void setPayop(String payop) {
		this.payop = payop;
	}


	public Date getPdate() {
		return pdate;
	}


	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}


	public String getPaymet() {
		return paymet;
	}


	public void setPaymet(String paymet) {
		this.paymet = paymet;
	}


	public String getPatamt() {
		return patamt;
	}


	public void setPatamt(String patamt) {
		this.patamt = patamt;
	}


	public Date getAnimal_date() {
		return animal_date;
	}


	public void setAnimal_date(Date animal_date) {
		this.animal_date = animal_date;
	}


	public String getS_email() {
		return s_email;
	}


	public void setS_email(String s_email) {
		this.s_email = s_email;
	}


	public String getS_uname() {
		return s_uname;
	}


	public void setS_uname(String s_uname) {
		this.s_uname = s_uname;
	}


	public Date getS_mdate() {
		return s_mdate;
	}


	public void setS_mdate(Date s_mdate) {
		this.s_mdate = s_mdate;
	}


	public String getS_mlevel() {
		return s_mlevel;
	}


	public void setS_mlevel(String s_mlevel) {
		this.s_mlevel = s_mlevel;
	}


	
	
	public String getImp_uid() {
		return imp_uid;
	}


	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}


	@Override
	public String toString() {
		return "uid=" + uid + ", imp_uid=" + imp_uid;
	}



	
	

	


	//toString

	
	
	
	
	
	
	
	
	
	
	
	
}// end
