package dining_res;

import java.sql.Timestamp;

import util.Parameter;

public class Dining_resVO extends Parameter {

	private int no; // pk
	private int member_pk; // member_pk
	private int dining_pk; // dining_pk
	private String d_day; // 예약날짜
	private String d_time; // 예약시간
	private int adult; // 예약인원
	private int kid; // 예약인원
	private String guest_kname; // 투숙객 한글명
	private String guest_ename; // 투숙객 영문명
	private int guest_tel; // 투숙객 연락처
	private String guest_email; // 투숙객 이메일
	private Timestamp regdate; // 예약신청일
	
	public Dining_resVO() {
		super.setPageRows(10);
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMember_pk() {
		return member_pk;
	}

	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}

	public int getDining_pk() {
		return dining_pk;
	}

	public void setDining_pk(int dining_pk) {
		this.dining_pk = dining_pk;
	}

	public String getD_day() {
		return d_day;
	}

	public void setD_day(String d_day) {
		this.d_day = d_day;
	}

	public String getD_time() {
		return d_time;
	}

	public void setD_time(String d_time) {
		this.d_time = d_time;
	}

	public int getAdult() {
		return adult;
	}

	public void setAdult(int adult) {
		this.adult = adult;
	}

	public int getKid() {
		return kid;
	}

	public void setKid(int kid) {
		this.kid = kid;
	}

	public String getGuest_kname() {
		return guest_kname;
	}

	public void setGuest_kname(String guest_kname) {
		this.guest_kname = guest_kname;
	}

	public String getGuest_ename() {
		return guest_ename;
	}

	public void setGuest_ename(String guest_ename) {
		this.guest_ename = guest_ename;
	}

	public int getGuest_tel() {
		return guest_tel;
	}

	public void setGuest_tel(int guest_tel) {
		this.guest_tel = guest_tel;
	}

	public String getGuest_email() {
		return guest_email;
	}

	public void setGuest_email(String guest_email) {
		this.guest_email = guest_email;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
