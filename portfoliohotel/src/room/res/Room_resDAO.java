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
	
	/**
	 * 객실 예약 등록
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insert(Room_resVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("room_res.insert", vo);
	}
	
	/**
	 * 객실 예약 상세
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public Room_resVO read(Room_resVO vo) throws SQLException {
		return (Room_resVO)getSqlMapClient().queryForObject("room_res.read", vo);
	}
	
	public int update(Room_resVO vo) throws SQLException {
		return getSqlMapClient().update("room_res.update", vo);
	}
	
	
	/**
	 * 객실 추가 옵션 예약
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insert(Room_opt_resVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("room_res.insert_opt", vo);
	}
}
