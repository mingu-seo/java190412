package board.qna;

import java.sql.Timestamp;

import util.Parameter;

public class QnaVO extends Parameter{
	
	private int no;
	private String memberid;
	private String title;
	private String contents;
	private Timestamp registdate;
	private String filename;
	private String filename_org;
	private String Filename_chk;
	private long filesize;
	private int gno;
	private int ono;
	private int nest;
	private int admin_pk;
	private String answer;
	
	public QnaVO() {
		super.setPageRows(10);
		//this.setSdisplay(-1);	// 검색기본값(전체)
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
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

	public Timestamp getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
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

	public String getFilename_chk() {
		return Filename_chk;
	}

	public void setFilename_chk(String filename_chk) {
		Filename_chk = filename_chk;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getNest() {
		return nest;
	}

	public void setNest(int nest) {
		this.nest = nest;
	}

	public int getAdmin_pk() {
		return admin_pk;
	}

	public void setAdmin_pk(int admin_pk) {
		this.admin_pk = admin_pk;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
	

	
	
}
