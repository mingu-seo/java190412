package manage.program;

import java.sql.Timestamp;

import util.Parameter;

public class ProgramVO extends Parameter {

	private int			no;						//프로그램 번호
	private int	 		member_pk;				//회원 번호 PK
	private int	 		category;				//카테고리 (1: 아동, 2: 청소년, 3: 성인)	
	private String		contents;				//내용
	private String		instructor;				//강사
	private int 		max_mem;				//최대인원
	private String 		imagename;				//첨부파일 이미지
	private Timestamp 	registdate;				//등록일
	private String 		state;					//현재모집중, 마감 표시
	private String 		target;					//프로그램에 적합한 타깃(굳이 필요한가?)
	private int 		price;					//프로그램 비용
	private String		p_time;					//프로그램 시간을 간단하게 표시하기위한 컬럼(ex: 매주 화,수요일 2시 이런식으로)
	private String		location;				//프로그램의 장소
	private int			display;				// 노출여부 (-1:전체, 0:미노출, 1:노출)
	
	
	public ProgramVO() {
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

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
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
