package room;

import util.Parameter;

public class Room_imageVO extends Parameter {

		private int no;
		private String image;
		private int room_pk;
		
		public int getNo() {
			return no;
		}
		public String getImage() {
			return image;
		}
		public int getRoom_pk() {
			return room_pk;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public void setRoom_pk(int room_pk) {
			this.room_pk = room_pk;
		}
				
}
