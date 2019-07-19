package board.qna;

import java.sql.Timestamp;

import util.Parameter;

public class QnaReplyVO extends Parameter {
	
	private int no;
	private int score;
	private String name;
	private String contents;
	private Timestamp registdate;
	private int product_pk;
	
	QnaReplyVO() {
		super.setPageRows(10);
	}
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getProduct_pk() {
		return product_pk;
	}
	public void setProduct_pk(int product_pk) {
		this.product_pk = product_pk;
	}
	
	
	

}
