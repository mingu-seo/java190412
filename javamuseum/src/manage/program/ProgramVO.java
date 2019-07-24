package manage.program;

import java.sql.Timestamp;

import util.Parameter;

public class ProgramVO extends Parameter {

	private int no;					//프로그램 번호
	private int category;			//카테고리(아동 : 1 청소년: 2 성인 : 3)
	private String title;			//제목
	private String contents;		//내용
	private String instructor;		//강사
	private int max_mem;			//최대인원
	private String imagename;		//첨부이미지
	private Timestamp registdate;	//등록일
	private String state;			//현재 상태(접수마감, 접수중)
	private String target;			//프로그램 대상 적는 곳
	private String price;			//프로그램 가격(But 현장접수)
	private String p_time;			//프로그램 간략한 시간 적는 곳
	private String location;		//장소
	private int display;			//노출 미노출
	
	private int opt_no;
	
	public void setOpt_no(int opt_no) {
		this.opt_no = opt_no;
	}
	
	public int getOpt_no() {
		return opt_no;
	}
	private String imagename_chk;	//임시 보관 이미지 
	
	public String getImagename_chk() {
		return imagename_chk;
	}

	public void setImagename_chk(String imagename_chk) {
		this.imagename_chk = imagename_chk;
	}

	public ProgramVO() {
		super.setPageRows(5);
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public int getMax_mem() {
		return max_mem;
	}

	public void setMax_mem(int max_mem) {
		this.max_mem = max_mem;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	public Timestamp getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getP_time() {
		return p_time;
	}

	public void setP_time(String p_time) {
		this.p_time = p_time;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}



}