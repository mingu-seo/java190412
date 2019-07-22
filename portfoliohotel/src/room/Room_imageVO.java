package room;

import util.Parameter;

public class Room_imageVO extends Parameter {

		private int no; //pk
		private String image; //이미지명
		private int room_pk; //객실 pk
		
		private String image_chk;
		
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
		
		public String getImage_chk() {
			return image_chk;
		}
		public void setImage_chk(String image_chk) {
			this.image_chk = image_chk;
		}
				
}
