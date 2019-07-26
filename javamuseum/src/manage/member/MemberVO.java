package manage.member;

import java.sql.Timestamp;

import util.Parameter;

public class MemberVO extends Parameter {
	private int no;					//	고유번호
	private String name;			//	회원명
	private String email;			//	회원이메일
	private String id;				//	회원아이디
	private String password;		//	회원비밀번호
	private String zipcode;			//	우편번호
	private String addr1;			//	주소
	private String addr2;			//	상세주소
	private int point;				//	포인트
	private String tel;				//	연락처
	private Timestamp reg_date;		//	등록일	
	private Timestamp mod_date;		//	수정일
	private String birthday;		//	생년월일
	private int gender;				//	성별
	
	private String email2;			//  이메일뒷주소
	private String fTel;			//	연락처(처음)
	private String mTel;			//	연락처(중간)
	private String eTel;			//	연락처(끝)
	private String year;			//	생년월일(년)
	private String month;			//	생년월일(월)
	private String day;				//	생년월일(일)
	private int accumpoint;
	
	public int getAccumpoint() {
		return accumpoint;
	}
	public void setAccumpoint(int accumpoint) {
		this.accumpoint = accumpoint;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	public String getfTel() {
		return fTel;
	}
	public void setfTel(String fTel) {
		this.fTel = fTel;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	public String geteTel() {
		return eTel;
	}
	public void seteTel(String eTel) {
		this.eTel = eTel;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public MemberVO() {
		super.setPageRows(10);
	}
	/**
	 * 생성자 페이지로우수 세팅
	 * @param pageRows 페이지 로우수
	 */
	public MemberVO(int pageRows) {
		super.setPageRows(pageRows);
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getMod_date() {
		return mod_date;
	}
	public void setMod_date(Timestamp mod_date) {
		this.mod_date = mod_date;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
}
