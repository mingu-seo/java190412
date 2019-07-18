package board.faq;

import java.sql.Timestamp;

import util.Parameter;

public class FaqVO extends Parameter {
	private int no; // 번호
	private String title; // 제목
	private String contents; // 답변
	private int display; // 노출
	private int category; // 질문종류
	private Timestamp regdate; // 등록일
	
	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public FaqVO() {
		super.setPageRows(10);
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getDisplay() {
		return display;
	}
	public void setDisplay(int display) {
		this.display = display;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
}
