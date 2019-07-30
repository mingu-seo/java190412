package manage.rental;

import java.sql.Timestamp;

import util.Parameter;

public class RentalVO extends Parameter {
	private int no;					// 고유 번호
	private int member_pk;			// 참조 회원 번호
	private int hallnumber;			// 대관할 전시관
	private String startdate;		// 대관 시작일
	private String enddate;			// 대관 종료일
	private int price;				// 예상 요금
	private String filename;		// 업로드 파일명
	private String filename_org;	// 파일 원본명
	private int filesize;			// 파일 크기
	private Timestamp registdate;	// 작성일
	private int confirm;			// 답변 유무
	private String tel;				// 연락처
	private String contents;		// 내용
	private String email;			// 이메일
	
	
	
	private String member_name;		// 회원 이름
	private String member_id;		// 회원 아이디
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public RentalVO() {
		super.setPageRows(10);
	}

	public RentalVO(int pageRows) {
		super.setPageRows(pageRows);
	}
	
	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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
	public int getHallnumber() {
		return hallnumber;
	}
	public void setHallnumber(int hallnumber) {
		this.hallnumber = hallnumber;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilename_org() {
		return filename_org;
	}
	public void setFilename_org(String filename_org) {
		this.filename_org = filename_org;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	public int getConfirm() {
		return confirm;
	}
	public void setConfirm(int confirm) {
		this.confirm = confirm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
