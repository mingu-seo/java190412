package pkg.dining;

import java.sql.Timestamp;

import util.Parameter;

public class PkgDiningVO extends Parameter {

	private int no; // dining 번호
	private String period; // dining 기간
	private String time_limit; // dining 시간
	private String set_name; // dining 세트 이름
	private String set_contents; // dining 메뉴 내용
	private String place; // dining 장소
	private Timestamp regdate; // dining 등록일
	private int set_price; // 세트 가격
	private int set_personnel; // 인원추천
	
	public PkgDiningVO() {
		super.setPageRows(10);
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getTime_limit() {
		return time_limit;
	}
	public void setTime_limit(String time_limit) {
		this.time_limit = time_limit;
	}
	public String getSet_name() {
		return set_name;
	}
	public void setSet_name(String set_name) {
		this.set_name = set_name;
	}
	public String getSet_contents() {
		return set_contents;
	}
	public void setSet_contents(String set_contents) {
		this.set_contents = set_contents;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getSet_price() {
		return set_price;
	}
	public void setSet_price(int set_price) {
		this.set_price = set_price;
	}
	public int getSet_personnel() {
		return set_personnel;
	}
	public void setSet_personnel(int set_personnel) {
		this.set_personnel = set_personnel;
	}
	
}