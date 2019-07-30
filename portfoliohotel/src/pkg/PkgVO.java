package pkg;

import java.sql.Timestamp;
import java.util.Date;


import util.Parameter;

public class PkgVO extends Parameter {

	private int no; // 번호
	private String name; // 이름
	private String startdate; // 시작일
	private String enddate; // 종료일
	private int price; // 가격
	private String pkg; // 포함내역
	private String event; // 이벤트
	private String guide; // 가이드
	private Timestamp regdate; // 등록일
	
	
	public PkgVO(int pageRows) {
		super.setPageRows(pageRows);
	}
	
	public PkgVO() {
		super.setPageRows(10);
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
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPkg() {
		return pkg;
	}
	public void setPkg(String pkg) {
		this.pkg = pkg;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}