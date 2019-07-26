package manage.review;

import java.sql.Timestamp;

import util.Parameter;


public class ReviewVO extends Parameter {
	
	private int no;
	private int member_pk;
	private int display_pk;
	private String title;
	private String contents;
	private double review_score;
	private int readno;
	private Timestamp registdate;
	private String imagename;
	private String imagename_org;
	private String imagename_chk;
	private int like_cnt;	

	public ReviewVO() {
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

	public int getDisplay_pk() {
		return display_pk;
	}

	public void setDisplay_pk(int display_pk) {
		this.display_pk = display_pk;
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

	public double getReview_score() {
		return review_score;
	}

	public void setReview_score(double review_score) {
		this.review_score = review_score;
	}

	public int getReadno() {
		return readno;
	}

	public void setReadno(int readno) {
		this.readno = readno;
	}

	public Timestamp getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	public String getImagename_org() {
		return imagename_org;
	}

	public void setImagename_org(String imagename_org) {
		this.imagename_org = imagename_org;
	}
	
	public String getImagename_chk() {
		return imagename_chk;
	}

	public void setImagename_chk(String imagename_chk) {
		this.imagename_chk = imagename_chk;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	
	
	
	
	
	
	
	
}