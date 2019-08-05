package dining_res;

import java.sql.Timestamp;

import util.Parameter;

public class Dining_resVO extends Parameter {

	private int no; // pk
	private int price; // 결제 금액
	private int member_pk; 
	private int dining_pk; 
	private String member_name; // 회원명
	private String dining_name; // 다이닝명
	private String d_day; // 예약날짜
	private String d_time; // 예약시간
	private int adult; // 예약인원
	private int kid; // 예약인원
	private String guest_lname; // 투숙객 성
	private String guest_fname; // 투숙객 이름
	private int guest_tel1; // 투숙객 연락처 앞자리
	private int guest_tel2; // 중간자리
	private int guest_tel3; // 끝자리
	private String guest_email; // 투숙객 이메일
	private Timestamp regdate; // 예약신청일
	private String orderCond; // 정렬조건
	
	public Dining_resVO() {
		super.setPageRows(10);
		this.orderCond = "";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getDining_name() {
		return dining_name;
	}

	public void setDining_name(String dining_name) {
		this.dining_name = dining_name;
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


	public String getGuest_lname() {
		return guest_lname;
	}

	public void setGuest_lname(String guest_lname) {
		this.guest_lname = guest_lname;
	}

	public String getGuest_fname() {
		return guest_fname;
	}

	public void setGuest_fname(String guest_fname) {
		this.guest_fname = guest_fname;
	}

	public int getGuest_tel1() {
		return guest_tel1;
	}

	public void setGuest_tel1(int guest_tel1) {
		this.guest_tel1 = guest_tel1;
	}

	public int getGuest_tel2() {
		return guest_tel2;
	}

	public void setGuest_tel2(int guest_tel2) {
		this.guest_tel2 = guest_tel2;
	}

	public int getGuest_tel3() {
		return guest_tel3;
	}

	public void setGuest_tel3(int guest_tel3) {
		this.guest_tel3 = guest_tel3;
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

	public String getOrderCond() {
		return orderCond;
	}

	public void setOrderCond(String orderCond) {
		this.orderCond = orderCond;
	}

}
