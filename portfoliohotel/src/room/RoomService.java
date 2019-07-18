package room;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.Function;

@Service
public class RoomService {

	@Autowired
	private RoomDAO roomDAO;
	
	public ArrayList list(RoomVO vo) throws Exception{
		ArrayList list = roomDAO.list(vo);
		return list;
	}
	
	public int insert(RoomVO vo, HttpServletRequest req) throws Exception{		
		int lastNo = (Integer)roomDAO.insert(vo);
		return lastNo;
	}
	
	public RoomVO read(RoomVO vo) throws SQLException {
		RoomVO read = roomDAO.read(vo);
		return read;
	}
	
	public int update(RoomVO vo, HttpServletRequest req) throws Exception {
		RoomVO read = roomDAO.read(vo);
		
		int r = roomDAO.update(vo);
		return r;
	}
	
	public int delete(RoomVO vo) throws SQLException {
		RoomVO read = roomDAO.read(vo);
		int r = roomDAO.delete(vo);
		
		return r;
	}
	
	public int groupDelete(RoomVO vo, HttpServletRequest req) throws Exception {
		String[] nos = req.getParameterValues("no");
		int delCount = 0;
		if(nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				RoomVO rvo = new RoomVO();
				rvo.setNo(Function.getIntParameter(nos[i]));
				RoomVO read = roomDAO.read(rvo);
				int r = roomDAO.delete(rvo);
				if(r > 0) {
					delCount++;
				}
			}			
		}
		return delCount;
	}
}
