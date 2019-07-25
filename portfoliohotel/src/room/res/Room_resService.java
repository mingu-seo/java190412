package room.res;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Room_resService {

	@Autowired
	private Room_resDAO room_resDAO;
	
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
	
	public int insert(Room_resVO vo) throws Exception {
		int lastNo = (Integer)room_resDAO.insert(vo);
		return lastNo;
	}
}
