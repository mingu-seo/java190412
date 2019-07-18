package room;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;


@Repository
public class RoomDAO extends SqlMapClientDAOSupport {
	
	/**
	 * 객실 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(RoomVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("room.list", vo);
	}
	
	/**
	 * 객실 등록
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insert(RoomVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("room.insert", vo);
	}
	
	/**
	 * 객실 상세
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public RoomVO read(RoomVO vo) throws SQLException {
		return (RoomVO)getSqlMapClient().queryForObject("room.read", vo);
	}
	
	/**
	 * 객실 수정
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int update(RoomVO vo) throws SQLException {
		return getSqlMapClient().update("room.update", vo);
	}
	
	/**
	 * 객실 삭제
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int delete(RoomVO vo) throws SQLException {
		return getSqlMapClient().delete("room.delete", vo);
	}
	
	public static void main(String[]args )throws SQLException {
		RoomVO vo = new RoomVO();
		RoomDAO dao = new RoomDAO();
		dao.list(vo);
	}	
	
}
