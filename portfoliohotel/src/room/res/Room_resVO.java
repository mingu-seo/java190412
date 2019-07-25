package room.res;

import java.sql.Timestamp;

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
	private String guest_kname; //숙박 고객 한글명
	private String guest_ename; //숙박 고객 영문명
	private int guest_tel; //숙박 고객 연락처
	private String guest_email; //숙박 고객 이메일
	private int pay_method; //결제 방법 (0:무통장입금  1:신용카드)
	private int pay_state; //결제 상태 (0:미결제  1:결제)
	private int res_state; //예약 상태 (0:취소  1:예약)
	
	public Room_resVO() {
		super.setPageRows(10);
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
	public String getGuest_kname() {
		return guest_kname;
	}
	public String getGuest_ename() {
		return guest_ename;
	}
	public int getGuest_tel() {
		return guest_tel;
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
	public void setGuest_kname(String guest_kname) {
		this.guest_kname = guest_kname;
	}
	public void setGuest_ename(String guest_ename) {
		this.guest_ename = guest_ename;
	}
	public void setGuest_tel(int guest_tel) {
		this.guest_tel = guest_tel;
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
	
}
