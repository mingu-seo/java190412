package member;

import java.sql.Timestamp;

import manage.admin.AdminVO;
import util.Parameter;

public class MemberVO extends Parameter{
	
	private int no;
	private String name;
	private String email1;
	private String email2;
	private String pw;
	private String tel1;
	private String tel2;
	private String tel3;
	private String birth;
	private String memo;
	private Timestamp registdate;
	
	public MemberVO() {
		super.setPageRows(10);
	}
	
	public String getTargetURLParam(String pageUrl, MemberVO param, int index) {

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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
		
}
