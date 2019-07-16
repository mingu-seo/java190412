package board.member;

import java.sql.Timestamp;

import util.Parameter;

public class MemberVo extends Parameter{
	
	private int no;					// 번호
	private String email;			// 이메일
	private String password;		// 패스워드
	private String name;			// 이름
	private int gender;				// 성별
	private String tel;				// 전화번호
	private String birthday;		// 생년월일
	private Timestamp regdate;		// 가입일
	private String zipcode;			// 우편번호
	private String addr;			// 주소
	private String addr_detail;		// 상세주소
	private Timestamp logindate;	// 최근 로그인 날짜
	private int point;				// 포인트
	private int grade;				// 멤버쉽 등급
	private int sns_type;			// 어떤sns로 가입하였는지
	private String sns_key;			// sns 공통요소
	private int secession;			// 탈퇴여부
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public Timestamp getLogindate() {
		return logindate;
	}
	public void setLogindate(Timestamp logindate) {
		this.logindate = logindate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getSns_type() {
		return sns_type;
	}
	public void setSns_type(int sns_type) {
		this.sns_type = sns_type;
	}
	public String getSns_key() {
		return sns_key;
	}
	public void setSns_key(String sns_key) {
		this.sns_key = sns_key;
	}
	public int getSecession() {
		return secession;
	}
	public void setSecession(int secession) {
		this.secession = secession;
	}

}
