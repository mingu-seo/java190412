package room;

import util.Parameter;

public class RoomVO extends Parameter{
	
	private int no; //객실 pk
	private int name; //객실 종류
	private int price; //객실 가격
	private int count; //객실 수량
	private int adult; //성인(기본정원)
	private int kid; //어린이(기본정원)
	private String instruction; //객실 소개
	private String checkin_time; //체크인 시간
	private String checkout_time; //체크아웃 시간
	private String location; //객실 위치
	private String landscape; //객실 뷰
	private String type; //객실 타입_방 개수
	private String image1; //객실 이미지 파일명
	private String image_org1; //객실 이미지 원본 파일명
	private String image2;
	private String image_org2;
	private String image3;
	private String image_org3;
	private String image4;
	private String image_org4;
	private String image5;
	private String image_org5;
	private String image6;
	private String image_org6;
	private String image7;
	private String image_org7;
	private String image8;
	private String image_org8;
	private String image9;
	private String image_org9;
	private String image10;
	private String image_org10;
	
	private String image_chk1;
	private String image_chk2;
	private String image_chk3;
	private String image_chk4;
	private String image_chk5;
	private String image_chk6;
	private String image_chk7;
	private String image_chk8;
	private String image_chk9;
	private String image_chk10;
	
	public int getNo() {
		return no;
	}
	public int getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public int getCount() {
		return count;
	}
	public int getAdult() {
		return adult;
	}
	public int getKid() {
		return kid;
	}
	public String getInstruction() {
		return instruction;
	}
	public String getCheckin_time() {
		return checkin_time;
	}
	public String getCheckout_time() {
		return checkout_time;
	}
	public String getLocation() {
		return location;
	}
	public String getLandscape() {
		return landscape;
	}
	public String getType() {
		return type;
	}
	public String getImage1() {
		return image1;
	}
	public String getImage_org1() {
		return image_org1;
	}
	public String getImage2() {
		return image2;
	}
	public String getImage_org2() {
		return image_org2;
	}
	public String getImage3() {
		return image3;
	}
	public String getImage_org3() {
		return image_org3;
	}
	public String getImage4() {
		return image4;
	}
	public String getImage_org4() {
		return image_org4;
	}
	public String getImage5() {
		return image5;
	}
	public String getImage_org5() {
		return image_org5;
	}
	public String getImage6() {
		return image6;
	}
	public String getImage_org6() {
		return image_org6;
	}
	public String getImage7() {
		return image7;
	}
	public String getImage_org7() {
		return image_org7;
	}
	public String getImage8() {
		return image8;
	}
	public String getImage_org8() {
		return image_org8;
	}
	public String getImage9() {
		return image9;
	}
	public String getImage_org9() {
		return image_org9;
	}
	public String getImage10() {
		return image10;
	}
	public String getImage_org10() {
		return image_org10;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(int name) {
		this.name = name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}
	public void setCheckin_time(String checkin_time) {
		this.checkin_time = checkin_time;
	}
	public void setCheckout_time(String checkout_time) {
		this.checkout_time = checkout_time;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setLandscape(String landscape) {
		this.landscape = landscape;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public void setImage_org1(String image_org1) {
		this.image_org1 = image_org1;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public void setImage_org2(String image_org2) {
		this.image_org2 = image_org2;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public void setImage_org3(String image_org3) {
		this.image_org3 = image_org3;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public void setImage_org4(String image_org4) {
		this.image_org4 = image_org4;
	}
	public void setImage5(String image5) {
		this.image5 = image5;
	}
	public void setImage_org5(String image_org5) {
		this.image_org5 = image_org5;
	}
	public void setImage6(String image6) {
		this.image6 = image6;
	}
	public void setImage_org6(String image_org6) {
		this.image_org6 = image_org6;
	}
	public void setImage7(String image7) {
		this.image7 = image7;
	}
	public void setImage_org7(String image_org7) {
		this.image_org7 = image_org7;
	}
	public void setImage8(String image8) {
		this.image8 = image8;
	}
	public void setImage_org8(String image_org8) {
		this.image_org8 = image_org8;
	}
	public void setImage9(String image9) {
		this.image9 = image9;
	}
	public void setImage_org9(String image_org9) {
		this.image_org9 = image_org9;
	}
	public void setImage10(String image10) {
		this.image10 = image10;
	}
	public void setImage_org10(String image_org10) {
		this.image_org10 = image_org10;
	}
	
	
	public String getImage_chk1() {
		return image_chk1;
	}
	public String getImage_chk2() {
		return image_chk2;
	}
	public String getImage_chk3() {
		return image_chk3;
	}
	public String getImage_chk4() {
		return image_chk4;
	}
	public String getImage_chk5() {
		return image_chk5;
	}
	public String getImage_chk6() {
		return image_chk6;
	}
	public String getImage_chk7() {
		return image_chk7;
	}
	public String getImage_chk8() {
		return image_chk8;
	}
	public String getImage_chk9() {
		return image_chk9;
	}
	public String getImage_chk10() {
		return image_chk10;
	}
	public void setImage_chk1(String image_chk1) {
		this.image_chk1 = image_chk1;
	}
	public void setImage_chk2(String image_chk2) {
		this.image_chk2 = image_chk2;
	}
	public void setImage_chk3(String image_chk3) {
		this.image_chk3 = image_chk3;
	}
	public void setImage_chk4(String image_chk4) {
		this.image_chk4 = image_chk4;
	}
	public void setImage_chk5(String image_chk5) {
		this.image_chk5 = image_chk5;
	}
	public void setImage_chk6(String image_chk6) {
		this.image_chk6 = image_chk6;
	}
	public void setImage_chk7(String image_chk7) {
		this.image_chk7 = image_chk7;
	}
	public void setImage_chk8(String image_chk8) {
		this.image_chk8 = image_chk8;
	}
	public void setImage_chk9(String image_chk9) {
		this.image_chk9 = image_chk9;
	}
	public void setImage_chk10(String image_chk10) {
		this.image_chk10 = image_chk10;
	}
	
	
}
