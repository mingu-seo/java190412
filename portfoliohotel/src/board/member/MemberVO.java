package board.member;

import java.sql.Timestamp;

import util.Parameter;

public class MemberVO extends Parameter {

	private int no; // 번호
	private String email; // 이메일
	private String password; // 패스워드
	private String f_name; // 성
	private String l_name; // 이름
	private int gender; // 성별
	private String f_tel; // 전화번호 앞자리
	private String m_tel; // 전화번호 중간
	private String l_tel; // 전화번호 끝자리
	private String birthday_year; // 생년월일 (년)
	private String birthday_month; // 생년월일 (월)
	private String birthday_day; // 생년월일 (일)
	private Timestamp regdate; // 가입일
	private String zipcode; // 우편번호
	private String addr; // 주소
	private String addr_detail; // 상세주소
	private int point;
	private int grade;
	private Timestamp logindate;
	private int sns_type;
	private String sns_key;
	private int secession;
	private int secession_reason;

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	private String ip;				//접속 아이피
	
	
	
	public MemberVO() {
		super.setPageRows(10);
	}

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

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getF_tel() {
		return f_tel;
	}

	public void setF_tel(String f_tel) {
		this.f_tel = f_tel;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getL_tel() {
		return l_tel;
	}

	public void setL_tel(String l_tel) {
		this.l_tel = l_tel;
	}

	public String getBirthday_year() {
		return birthday_year;
	}

	public void setBirthday_year(String birthday_year) {
		this.birthday_year = birthday_year;
	}

	public String getBirthday_month() {
		return birthday_month;
	}

	public void setBirthday_month(String birthday_month) {
		this.birthday_month = birthday_month;
	}

	public String getBirthday_day() {
		return birthday_day;
	}

	public void setBirthday_day(String birthday_day) {
		this.birthday_day = birthday_day;
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

	public Timestamp getLogindate() {
		return logindate;
	}

	public void setLogindate(Timestamp logindate) {
		this.logindate = logindate;
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

	public int getSecession_reason() {
		return secession_reason;
	}

	public void setSecession_reason(int secession_reason) {
		this.secession_reason = secession_reason;
	}

	
	
	

}
