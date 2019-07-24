package room;

import util.Parameter;

public class RoomVO extends Parameter{
	
	private int no; //객실 pk
	private int name; //객실 종류
	private int price; //객실 가격
	private int count; //객실 수량
	private int adult; //성인(기본정원)
	private int kid; //어린이(기본정원)
	private String instruction; //객실 소개
	private String checkin_time; //체크인 시간
	private String checkout_time; //체크아웃 시간
	private String location; //객실 위치
	private String landscape; //객실 뷰
	private String type; //객실 타입_방 개수
	
	public int getNo() {
		return no;
	}
	public int getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public int getCount() {
		return count;
	}
	public int getAdult() {
		return adult;
	}
	public int getKid() {
		return kid;
	}
	public String getInstruction() {
		return instruction;
	}
	public String getCheckin_time() {
		return checkin_time;
	}
	public String getCheckout_time() {
		return checkout_time;
	}
	public String getLocation() {
		return location;
	}
	public String getLandscape() {
		return landscape;
	}
	public String getType() {
		return type;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(int name) {
		this.name = name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}
	public void setCheckin_time(String checkin_time) {
		this.checkin_time = checkin_time;
	}
	public void setCheckout_time(String checkout_time) {
		this.checkout_time = checkout_time;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setLandscape(String landscape) {
		this.landscape = landscape;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
