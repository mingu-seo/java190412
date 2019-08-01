package pkg;

import java.sql.Timestamp;
import java.util.Date;


import util.Parameter;

public class PkgVO extends Parameter {

	private int no; // 번호
	private String kname; // 패키지 한글이름
	private String ename; //패키지 영어이름
	private String intro; // 패키지 소개
	private String intro_detail; // 패키지 상세 소개
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
	
	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
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

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getIntro_detail() {
		return intro_detail;
	}

	public void setIntro_detail(String intro_detail) {
		this.intro_detail = intro_detail;
	}
	
}