package room;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;


@Repository
public class RoomDAO extends SqlMapClientDAOSupport {
	
	/**
	 * 목록 조회
	 * @author 현수
	 * @param ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(RoomVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("room.list", vo);
	}
}
