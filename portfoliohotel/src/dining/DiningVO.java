package dining;

import util.Parameter;

public class DiningVO extends Parameter {

	private int no; // 글번호
	private String name; // 다이닝명
	private int price; // 다이닝 가격
	private int count; // 다이닝 수량
	private String imagename; // 다이닝 이미지
	private String imagename_org; // 다이닝 이미지 원본 파일명
	private String startdate; // 운영기간 시작
	private String enddate; // 운영기간 종료
	private String book_period; // 예약기간
	private String inclusion; // 포함내역
	private String info; // 안내

	// 검색조건
	private int display; // 노출여부 (-1:전체, 0:미노출, 1:노출)

	public DiningVO() {
		super.setPageRows(10);
		this.setDisplay(-1);
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
    
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getBook_period() {
		return book_period;
	}

	public void setBook_period(String book_period) {
		this.book_period = book_period;
	}

	public String getInclusion() {
		return inclusion;
	}

	public void setInclusion(String inclusion) {
		this.inclusion = inclusion;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

}
