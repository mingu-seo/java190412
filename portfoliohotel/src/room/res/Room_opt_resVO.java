package room.res;

import util.Parameter;

public class Room_opt_resVO extends Parameter {
	
	private int no;
	private int room_res_pk;
	private int option_pk;
	private int count;
	private String name;
	private int price;
	private int total_price;
	
	public int getNo() {
		return no;
	}
	public int getRoom_res_pk() {
		return room_res_pk;
	}
	public int getOption_pk() {
		return option_pk;
	}
	public int getCount() {
		return count;
	}
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setRoom_res_pk(int room_res_pk) {
		this.room_res_pk = room_res_pk;
	}
	public void setOption_pk(int option_pk) {
		this.option_pk = option_pk;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
}
