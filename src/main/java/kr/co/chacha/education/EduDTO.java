package kr.co.chacha.education;

public class EduDTO {

	private String eduno;		//교육신청번호
	private String uid;
	private int eduop;			//강의구분
	private String edu_date;	//교육신청날짜
	private int quizno;			//퀴즈번호
	private String quiz_cont;	//퀴즈내용
	private int ox;				//정답
	private int subno;   		//퀴즈제출번호
	private int answer;			//답변
	private int	score;			//점수
	private String quiz_date;	//제출날짜

	public EduDTO() {}

	public String getEduno() {
		return eduno;
	}

	public void setEduno(String eduno) {
		this.eduno = eduno;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getEduop() {
		return eduop;
	}

	public void setEduop(int eduop) {
		this.eduop = eduop;
	}

	public String getEdu_date() {
		return edu_date;
	}

	public void setEdu_date(String edu_date) {
		this.edu_date = edu_date;
	}

	public int getQuizno() {
		return quizno;
	}

	public void setQuizno(int quizno) {
		this.quizno = quizno;
	}

	public String getQuiz_cont() {
		return quiz_cont;
	}

	public void setQuiz_cont(String quiz_cont) {
		this.quiz_cont = quiz_cont;
	}

	public int getOx() {
		return ox;
	}

	public void setOx(int ox) {
		this.ox = ox;
	}

	public int getSubno() {
		return subno;
	}

	public void setSubno(int subno) {
		this.subno = subno;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getQuiz_date() {
		return quiz_date;
	}

	public void setQuiz_date(String quiz_date) {
		this.quiz_date = quiz_date;
	}

	@Override
	public String toString() {
		return "EduDTO [eduno=" + eduno + ", uid=" + uid + ", eduop=" + eduop + ", edu_date=" + edu_date + ", quizno="
				+ quizno + ", quiz_cont=" + quiz_cont + ", ox=" + ox + ", subno=" + subno + ", answer=" + answer
				+ ", score=" + score + ", quiz_date=" + quiz_date + "]";
	}
	
	
}
