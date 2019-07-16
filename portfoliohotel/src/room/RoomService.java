package room;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomService {

	@Autowired
	private RoomDAO roomDAO;
	
	public ArrayList list(RoomVO vo) throws Exception{
		ArrayList list = roomDAO.list(vo);
		return list;
	}
}
