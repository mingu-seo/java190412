package board.qna;

import java.sql.Timestamp;

import util.Parameter;

public class ReplyVO extends Parameter {
	
	private int no;
	private int qna_no;
	private String title;
	private String contents;
	private int admin_pk;
	private int member_pk;
	private String filename;
	private String filename_org;
	private Timestamp registdate;
	private int display;
	private int animal_pk;
	
	ReplyVO() {
		super.setPageRows(10);
	}	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
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
	public int getAdmin_pk() {
		return admin_pk;
	}
	public void setAdmin_pk(int admin_pk) {
		this.admin_pk = admin_pk;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
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
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	public int getDisplay() {
		return display;
	}
	public void setDisplay(int display) {
		this.display = display;
	}
	public int getAnimal_pk() {
		return animal_pk;
	}
	public void setAnimal_pk(int animal_pk) {
		this.animal_pk = animal_pk;
	}

	
	
	
	
	
}
