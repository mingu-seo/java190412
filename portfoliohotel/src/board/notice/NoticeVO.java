package board.notice;

import java.sql.Timestamp;
import java.util.Date;

import util.Parameter;

public class NoticeVO extends Parameter {

	private int no; // 번호
	private String name; // 이름
	private String title; // 제목
	private String contents; // 내용
	private Timestamp regdate; // 등록일
	private String file; // 파일
	private String file_org; // 파일 원본
	private int display; // 노출
	private int top; // 상단노출
	private int readno; // 조회수
	private int member; // 비밀글
	
	private String file_chk; // 첨부파일 체크
	
	public String getFile_chk() {
		return file_chk;
	}

	public void setFile_chk(String file_chk) {
		this.file_chk = file_chk;
	}
	
	public NoticeVO(int pageRows) {
		super.setPageRows(pageRows);
	}

	public NoticeVO() {
		super.setPageRows(10);
		this.member = 0;
		this.display=0;
		this.top=0;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String content) {
		this.contents = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getFile_org() {
		return file_org;
	}
	public void setFile_org(String file_org) {
		this.file_org = file_org;
	}
	public int getDisplay() {
		return display;
	}
	public void setDisplay(int display) {
		this.display = display;
	}
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public int getReadno() {
		return readno;
	}
	public void setReadno(int readno) {
		this.readno = readno;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
}