package room.res;

import java.sql.Timestamp;

import util.DateUtil;
import util.Parameter;

public class Room_resVO  extends Parameter{
	
	private int no; //pk
	private int room_pk; //객실 pk
	private String room_name; //객실명
	private int member_pk; //회원 pk
	private String checkin; //체크인 일자
	private String checkout; //체크아웃 일자
	private Timestamp bookdate; //예약일
	private int adult; //숙박인원 성인
	private int kid; //숙박인원 어린이
	private int room_price; //객실 금액
	private int person_price; //추가인원 금액
	private int option_price; //추가옵션 금액
	private int charge_price; //세금 및 수수료 금액
	private int total_price; //총 금액
	private String guest_lastname; //숙박 고객 성
	private String guest_firstname; //숙박 고객 이름
	private String guest_tel1; //숙박 고객 연락처
	private String guest_tel2; //숙박 고객 연락처
	private String guest_tel3; //숙박 고객 연락처
	private String guest_email; //숙박 고객 이메일
	private int pay_method; //결제 방법 (0:무통장입금  1:신용카드)
	private int pay_state; //결제 상태 (0:미결제  1:결제)
	private int res_state; //예약 상태 (0:취소  1:예약)
	
	private String paydate; //결제일
	
	private int category; //예약 내역 (1:지난 예약  2:다가오는 예약  3:신청된 예약  4:취소된 예약)
	private String scheckin; //검색조건 체크인
	private String scheckout; //검색조건 체크아웃
	
	private int month_want;
	
	public Room_resVO() {
		super.setPageRows(10);
	}	
	public Room_resVO(int pageRows) {
		super.setPageRows(pageRows);
	}
	
	public int getNo() {
		return no;
	}
	public int getRoom_pk() {
		return room_pk;
	}
	public String getRoom_name() {
		return room_name;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public String getCheckin() {
		return checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public Timestamp getBookdate() {
		return bookdate;
	}
	public int getAdult() {
		return adult;
	}
	public int getKid() {
		return kid;
	}
	public int getRoom_price() {
		return room_price;
	}
	public int getPerson_price() {
		return person_price;
	}
	public int getOption_price() {
		return option_price;
	}
	public int getCharge_price() {
		return charge_price;
	}
	public int getTotal_price() {
		return total_price;
	}
	public String getGuest_email() {
		return guest_email;
	}
	public int getPay_method() {
		return pay_method;
	}
	public int getPay_state() {
		return pay_state;
	}
	public int getRes_state() {
		return res_state;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setRoom_pk(int room_pk) {
		this.room_pk = room_pk;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public void setBookdate(Timestamp bookdate) {
		this.bookdate = bookdate;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public void setPerson_price(int person_price) {
		this.person_price = person_price;
	}
	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
	public void setCharge_price(int charge_price) {
		this.charge_price = charge_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public void setGuest_email(String guest_email) {
		this.guest_email = guest_email;
	}
	public void setPay_method(int pay_method) {
		this.pay_method = pay_method;
	}
	public void setPay_state(int pay_state) {
		this.pay_state = pay_state;
	}
	public void setRes_state(int res_state) {
		this.res_state = res_state;
	}

	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getScheckin() {
		return scheckin;
	}
	public String getScheckout() {
		return scheckout;
	}
	public void setScheckin(String scheckin) {
		this.scheckin = scheckin;
	}
	public void setScheckout(String scheckout) {
		this.scheckout = scheckout;
	}
	public int getMonth_want() {
		return month_want;
	}
	public void setMonth_want(int month_want) {
		this.month_want = month_want;
	}
	public String getGuest_lastname() {
		return guest_lastname;
	}
	public String getGuest_firstname() {
		return guest_firstname;
	}
	public String getGuest_tel1() {
		return guest_tel1;
	}
	public String getGuest_tel2() {
		return guest_tel2;
	}
	public String getGuest_tel3() {
		return guest_tel3;
	}
	public void setGuest_lastname(String guest_lastname) {
		this.guest_lastname = guest_lastname;
	}
	public void setGuest_firstname(String guest_firstname) {
		this.guest_firstname = guest_firstname;
	}
	public void setGuest_tel1(String guest_tel1) {
		this.guest_tel1 = guest_tel1;
	}
	public void setGuest_tel2(String guest_tel2) {
		this.guest_tel2 = guest_tel2;
	}
	public void setGuest_tel3(String guest_tel3) {
		this.guest_tel3 = guest_tel3;
	}
	
}
