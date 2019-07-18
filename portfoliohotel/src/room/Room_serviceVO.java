package room;

import util.Parameter;

public class Room_serviceVO extends Parameter {
	
	private int no;
	private String name;
	private int room_pk;
	
	public int getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public int getRoom_pk() {
		return room_pk;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setRoom_pk(int room_pk) {
		this.room_pk = room_pk;
	}
	
	
}
