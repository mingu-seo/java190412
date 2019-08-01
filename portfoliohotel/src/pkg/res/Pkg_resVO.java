package pkg.res;

import java.sql.Timestamp;

import util.Parameter;

public class Pkg_resVO extends Parameter {

	private int no; //pk
	private int pkg_pk; // 패키지 pk
	private String pkg_name; // 패키지명
	private int member_pk; // 회원 pk
	private Timestamp purchase_date; // 구매일
	private String use_date; // 사용일
	private String guest_kname; // 고객 한글명
	private String guest_ename; // 고객 영문명
	private int guest_tel; // 고객 연락처
	private String guest_email; // 고객 이메일
	private int pkg_price; // 패키지 가격
	private int pkg_count; // 패키지 수량
	private int total_price; // 총 가격
	
	
	public Pkg_resVO(int pageRows) {
		super.setPageRows(pageRows);
	}
	public Pkg_resVO() {
		super.setPageRows(10);
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPkg_pk() {
		return pkg_pk;
	}
	public void setPkg_pk(int pkg_pk) {
		this.pkg_pk = pkg_pk;
	}
	public String getPkg_name() {
		return pkg_name;
	}
	public void setPkg_name(String pkg_name) {
		this.pkg_name = pkg_name;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public Timestamp getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(Timestamp purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getUse_date() {
		return use_date;
	}
	public void setUse_date(String use_date) {
		this.use_date = use_date;
	}
	public String getGuest_kname() {
		return guest_kname;
	}
	public void setGuest_kname(String guest_kname) {
		this.guest_kname = guest_kname;
	}
	public String getGuest_ename() {
		return guest_ename;
	}
	public void setGuest_ename(String guest_ename) {
		this.guest_ename = guest_ename;
	}
	public int getGuest_tel() {
		return guest_tel;
	}
	public void setGuest_tel(int guest_tel) {
		this.guest_tel = guest_tel;
	}
	public String getGuest_email() {
		return guest_email;
	}
	public void setGuest_email(String guest_email) {
		this.guest_email = guest_email;
	}
	public int getPkg_price() {
		return pkg_price;
	}
	public void setPkg_price(int pkg_price) {
		this.pkg_price = pkg_price;
	}
	public int getPkg_count() {
		return pkg_count;
	}
	public void setPkg_count(int pkg_count) {
		this.pkg_count = pkg_count;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
}