package pkg.dining;

import java.sql.Timestamp;

import util.Parameter;

public class PkgDiningVO extends Parameter {

	private int no; // petit 번호
	private String petit_title; // petit 제목
	private String petit_event; // petit 이벤트 내용
	private String petit_time; // petit 이벤트 시간
	private String petit_menu; // petit 메뉴
	private String petit_place; // petit 장소
	private Timestamp registdate; // petit 등록일
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPetit_event() {
		return petit_event;
	}
	public void setPetit_event(String petit_event) {
		this.petit_event = petit_event;
	}
	public String getPetit_time() {
		return petit_time;
	}
	public void setPetit_time(String petit_time) {
		this.petit_time = petit_time;
	}
	public String getPetit_menu() {
		return petit_menu;
	}
	public void setPetit_menu(String petit_menu) {
		this.petit_menu = petit_menu;
	}
	public String getPetit_place() {
		return petit_place;
	}
	public void setPetit_place(String petit_place) {
		this.petit_place = petit_place;
	}
	public String getPetit_title() {
		return petit_title;
	}
	public void setPetit_title(String petit_title) {
		this.petit_title = petit_title;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	
}