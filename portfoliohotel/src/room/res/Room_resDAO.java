package room.res;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class Room_resDAO extends SqlMapClientDAOSupport {
	
	/**
	 * 객실 예약 목록
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public ArrayList list(Room_resVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("room_res.list", vo);
	}
	
	public int insert(Room_resVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("room_res.insert", vo);
	}
	
}
