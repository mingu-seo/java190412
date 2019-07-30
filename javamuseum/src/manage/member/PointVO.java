package manage.member;

import java.sql.Timestamp;

import util.Parameter;

public class PointVO extends Parameter {

	private int no;					// 고유번호
	private int member_pk;			// 회원번호
	private int accum;				// 적립 및 사용 금액		
	private String memo;			// 적립 및 사용 출처
	private int state;				// 구분 (적립: 0, 사용: 1)
	private Timestamp registdate;	// 등록일
	private int display_pk;			//예매 번호
	
	public PointVO() {
		super.setPageRows(10);
		this.state = 2;
	}
	
	public PointVO(int pageRows) {
		super.setPageRows(pageRows);
	}
	
	public int getDisplay_pk() {
		return display_pk;
	}
	
	public void setDisplay_pk(int display_pk) {
		this.display_pk = display_pk;
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
	public int getAccum() {
		return accum;
	}
	public void setAccum(int accum) {
		this.accum = accum;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	
	
}
