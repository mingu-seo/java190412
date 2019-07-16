package room.opt;

import util.Parameter;

public class Room_optVO extends Parameter {
	
	private int no;
	private String name;
	private String instruction;
	private String image;
	private String image_org;
	private String info;
	private int price;
	
	public int getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public String getInstruction() {
		return instruction;
	}
	public String getImage() {
		return image;
	}
	public String getImage_org() {
		return image_org;
	}
	public String getInfo() {
		return info;
	}
	public int getPrice() {
		return price;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setImage_org(String image_org) {
		this.image_org = image_org;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
