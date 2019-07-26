package room.res;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import room.RoomDAO;
import room.Room_optVO;

@Service
public class Room_resService {

	@Autowired
	private Room_resDAO room_resDAO;
	private RoomDAO roomDAO;
	
	
	/**
	 * 객실 예약 목록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public ArrayList list(Room_resVO vo) throws Exception{
		ArrayList list = room_resDAO.list(vo);
		return list;
	}
	
	public int insert(Room_resVO vo, Room_opt_resVO ovo, HttpServletRequest req) throws Exception {
		int r = (Integer)room_resDAO.insert(vo);
		
		String[] option_pk = req.getParameterValues("option_pk");
		String[] price_opt = req.getParameterValues("price_opt");
		String[] price = req.getParameterValues("price");
		String[] name = req.getParameterValues("name");
		Room_opt_resVO novo = new Room_opt_resVO();
		novo.setRoom_res_pk(r);
		for(int i=0; i<option_pk.length; i++) {
			novo.setOption_pk(Integer.parseInt(option_pk[i]));
			novo.setCount(Integer.parseInt(price_opt[i]));
			novo.setPrice(Integer.parseInt(price[i]));
			novo.setName(name[i]);
			novo.setTotal_price(novo.getPrice() * novo.getCount());
			room_resDAO.insert_opt(novo);
		}
		return r;
	}
	
	public Room_resVO read(Room_resVO vo) throws Exception {
		Room_resVO read = room_resDAO.read(vo);
		return read;
	}
	
	public int update(Room_resVO vo) throws Exception {
		Room_resVO read = room_resDAO.read(vo);
		int r = room_resDAO.update(vo);
		return r;
	}
	
	public int cancel(Room_resVO vo) throws Exception {
		Room_resVO read = room_resDAO.read(vo);
		int r = room_resDAO.cancel(read.getNo());
		return r;
	}
	
	public ArrayList list_opt(int room_opt_pk) throws Exception {
		ArrayList list = room_resDAO.list_opt(room_opt_pk);
		return list;
	}
}
