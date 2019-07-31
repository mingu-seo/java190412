package manage.ticket;

import java.sql.Timestamp;

import util.Parameter;

public class TicketVO extends Parameter{

	private int no;						//번호
	private int member_pk;				//멤버pk
	private int display_pk;				//전시pk
	
	//금액 관련 정보
	private int price;					//기본금액
	private int pay_price;				//할인 후 결제 금액
	private int sale_price;				//할인 금액
	
	//회원 필요 정보
	private String name;				//회원 이름
	private String id;					//회원 아이디
	
	//인원 정보
	private int number;					//예매 인원
	private int old_number;				//65세 이상 인원
	private int adult_number;			//성인 인원
	private int student_number;			//학생 인원
	
	//전시 정보
	private String title;				//전기 작품 제목
	private int state;				//작품 전기관 번호
	
	private int point_pk;				//포인트pk
	private int usepoint;				//사용포인트
	private int storepoint;				//적립포인트
	private int point;
	
	private String displaydate;			//구경 일자
	private String reservedate;			//예매 일자
	private String canceldate;			//취소 일자
	private String paydate;
	
	private int paystate;				//결제 상태
	private int reservestate;			//예매 상태
	private int refundstate;			//환불 상태
	
	private String method;				//결제 방법
	
	//검색 조건
	private int resStateSave;				//예매 상태 저장
	private int payStateSave;				//결제 상태 저장
	private String meth;				//결제 방법 저장
	private String startdate1;
	private String enddate1;
	private String startdate2;
	private String enddate2;
	
	public TicketVO() {
		super.setPageRows(10);
	}
	
	public int getPoint() {
		return point;
	}
	
	public void setPoint(int point) {
		this.point = point;
	}
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}
	
	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	
	public String getPaydate() {
		return paydate;
	}

	public void setPaydate(String paydate) {
		this.paydate = paydate;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getPoint_pk() {
		return point_pk;
	}
	public void setPoint_pk(int point_pk) {
		this.point_pk = point_pk;
	}
	
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public int getStorepoint() {
		return storepoint;
	}
	public void setStorepoint(int storepoint) {
		this.storepoint = storepoint;
	}
	public String getDisplaydate() {
		return displaydate;
	}
	public void setDisplaydate(String displaydate) {
		this.displaydate = displaydate;
	}
	public String getReservedate() {
		return reservedate;
	}
	public void setReservedate(String reservedate) {
		this.reservedate = reservedate;
	}
	public String getCanceldate() {
		return canceldate;
	}
	public void setCanceldate(String canceldate) {
		this.canceldate = canceldate;
	}
	public int getPaystate() {
		return paystate;
	}
	public void setPaystate(int paystate) {
		this.paystate = paystate;
	}
	public int getReservestate() {
		return reservestate;
	}
	public void setReservestate(int reservestate) {
		this.reservestate = reservestate;
	}
	public int getRefundstate() {
		return refundstate;
	}
	public void setRefundstate(int refundstate) {
		this.refundstate = refundstate;
	}
	
	public int getSale_price() {
		return sale_price;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getOld_number() {
		return old_number;
	}

	public void setOld_number(int old_number) {
		this.old_number = old_number;
	}

	public int getAdult_number() {
		return adult_number;
	}

	public void setAdult_number(int adult_number) {
		this.adult_number = adult_number;
	}

	public int getStudent_number() {
		return student_number;
	}

	public void setStudent_number(int student_number) {
		this.student_number = student_number;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getResStateSave() {
		return resStateSave;
	}

	public void setResStateSave(int resStateSave) {
		this.resStateSave = resStateSave;
	}

	public int getPayStateSave() {
		return payStateSave;
	}

	public void setPayStateSave(int payStateSave) {
		this.payStateSave = payStateSave;
	}

	public String getMeth() {
		return meth;
	}

	public void setMeth(String meth) {
		this.meth = meth;
	}

	public String getStartdate1() {
		return startdate1;
	}

	public void setStartdate1(String startdate1) {
		this.startdate1 = startdate1;
	}

	public String getEnddate1() {
		return enddate1;
	}

	public void setEnddate1(String enddate1) {
		this.enddate1 = enddate1;
	}

	public String getStartdate2() {
		return startdate2;
	}

	public void setStartdate2(String startdate2) {
		this.startdate2 = startdate2;
	}

	public String getEnddate2() {
		return enddate2;
	}

	public void setEnddate2(String enddate2) {
		this.enddate2 = enddate2;
	}
	
}
