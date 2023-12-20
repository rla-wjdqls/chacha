package kr.co.chacha.center;

public class CenterDTO {
	
	//동물 (글)
	private String anino;
    private String uid;
    private String aname;
    private int age;
    private String gender;
    private String weight;
    private String genop;
    private String vac;
    private String intro;
    private String anipic;
    private String adopt; 
    private int cnt;
    private String adopt_pos;
    
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getAdopt_pos() {
		return adopt_pos;
	}

	public void setAdopt_pos(String adopt_pos) {
		this.adopt_pos = adopt_pos;
	}

	//toString()
	@Override
	public String toString() {
		return "CenterDTO [anino=" + anino + ", uid=" + uid + ", aname=" + aname + ", age=" + age + ", gender=" + gender
				+ ", weight=" + weight + ", genop=" + genop + ", vac=" + vac + ", intro=" + intro + ", anipic=" + anipic
				+ ", adopt=" + adopt + ", cnt=" + cnt + ", adopt_pos=" + adopt_pos + "]";
	}
	  
}
