package manage.reservation;

import java.sql.Timestamp;

import util.Parameter;

public class ReservationVO extends Parameter {

	private int no;					// 번호
	private int member_pk;			// 회원 번호
	private int program_pk;			// 프로그램 번호
	
	
	private int time;				// 프로그램 시간
	private String date;			// 프로그램 날짜 
	private Timestamp registdate;	// 신청 일자
	
	private String title;
	private String name;
	private String id;
	private int category;
	
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public ReservationVO() {
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
	public int getProgram_pk() {
		return program_pk;
	}
	public void setProgram_pk(int program_pk) {
		this.program_pk = program_pk;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}


}