package room;

import util.Parameter;

public class Room_serviceVO extends Parameter {
	
	private int no;
	private String name_s;
	private int room_pk;
	
	public int getNo() {
		return no;
	}
	public String getName_s() {
		return name_s;
	}
	public int getRoom_pk() {
		return room_pk;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName_s(String name_s) {
		this.name_s = name_s;
	}
	public void setRoom_pk(int room_pk) {
		this.room_pk = room_pk;
	}
	
}
