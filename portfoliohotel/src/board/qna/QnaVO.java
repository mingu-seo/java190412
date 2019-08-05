package board.qna;

import java.sql.Timestamp;


import util.Parameter;

public class QnaVO extends Parameter {
	private int 		no;					// 글번호 (pk)
	private int 		category;			// 문의 분류
	private String 		email;				// 이메일
	private String		firstName;			// 성 
	private String		lastName;			// 이름 
	private int 		tel1;				// 휴대폰
	private int 		tel2;				// 휴대폰
	private int 		tel3;				// 휴대폰
	private String 		password;			// 비밀번호
	private String 		title;				// QnA제목
	private String		contents;			// QnA내용
	private Timestamp	regdate;			// QnA등록일
	private String		file;				// 첨부파일명
	private String		file_org;			// 첨부파일 원본명
	private long 		filesize;			// 첨부파일 크기
	private int			open;				// 공개여부(비공개 :0 / 공개 :1)
	private int			reply;				// 답변여부(미완료 :0 / 완료 :1)
	private String		reply_title;		// 답변제목 (re:"title")
	private String		reply_contents;		// 답변내용
	private Timestamp	reply_regdate;		// 답변 등록일
	private int 		send_email;			// 이메일 전송여부 (미전송 :0 / 전송:1)
	private String 		file_chk;
	//검색조건(페이지) 추가
	private int display;
	
	public QnaVO() {
		super.setPageRows(10);
		this.setDisplay(-1);
		this.setOpen(-1);
		this.setReply(-1);
	}
	public QnaVO(int pageRows) {
		super.setPageRows(pageRows);
	}
	public String getTargetURLParam(String pageUrl, QnaVO param, int index) {

		StringBuffer strList= new StringBuffer();

		if (param != null) {
			strList.append(pageUrl);
			strList.append("?stype=" + param.getStype());
			strList.append("&sval="+param.getSval());
			strList.append("&reqPageNo="+param.getReqPageNo());
			if (index > 0) {
				strList.append("&no="+index);
			}
		}
		return strList.toString();
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public String getReply_title() {
		return reply_title;
	}

	public void setReply_title(String reply_title) {
		this.reply_title = reply_title;
	}

	public String getReply_contents() {
		return reply_contents;
	}

	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}

	public Timestamp getReply_regdate() {
		return reply_regdate;
	}

	public void setReply_regdate(Timestamp reply_regdate) {
		this.reply_regdate = reply_regdate;
	}

	public int getSend_email() {
		return send_email;
	}

	public void setSend_email(int send_email) {
		this.send_email = send_email;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
	public String getFile_chk() {
		return file_chk;
	}
	public void setFile_chk(String file_chk) {
		this.file_chk = file_chk;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getTel1() {
		return tel1;
	}
	public void setTel1(int tel1) {
		this.tel1 = tel1;
	}
	public int getTel2() {
		return tel2;
	}
	public void setTel2(int tel2) {
		this.tel2 = tel2;
	}
	public int getTel3() {
		return tel3;
	}
	public void setTel3(int tel3) {
		this.tel3 = tel3;
	}
	
	
	
}
