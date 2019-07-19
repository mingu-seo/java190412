package room;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

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
	
	public void insert_image(HashMap map) throws SQLException {
		getSqlMapClient().insert("room.insert_image", map);
	}
	
	public ArrayList list_image(int room_pk) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("room.list_image", room_pk);
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
	
	public void delete_image(int no) throws SQLException {
		getSqlMapClient().delete("room.delete_image", no);
	}
	
	
	
	
	/**
	 * 객실 옵션 목록 조회
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public ArrayList list_opt(Room_optVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("room.list_opt", vo);
	}
	
	/**
	 * 객실 옵션 등록
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insert_opt(Room_optVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("room.insert_opt", vo);
	}
	
	/**
	 * 객실 옵션 상세
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public Room_optVO read_opt(Room_optVO vo) throws SQLException {
		return (Room_optVO)getSqlMapClient().queryForObject("room.read_opt", vo);
	}
	
	/**
	 * 객실 옵션 수정
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int update_opt(Room_optVO vo) throws SQLException {
		return getSqlMapClient().update("room.update_opt", vo);
	}
	
	/**
	 * 객실 옵션 삭제
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int delete_opt(Room_optVO vo) throws SQLException {
		return getSqlMapClient().delete("room.delete_opt", vo);
	}
	
	
	
	/**
	 * 객실 편의시설 목록 조회
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<HashMap> list_service(int room_pk) throws SQLException{
		return (ArrayList<HashMap>)getSqlMapClient().queryForList("room.list_service", room_pk);
	}
		
	/**
	 * 객실 편의시설 등록
	 * @param map
	 * @throws SQLException
	 */
	public void insert_service(HashMap map) throws SQLException {
		getSqlMapClient().insert("room.insert_service", map);
	}
	
	/**
	 * 객실 편의시설 수정
	 * @param map
	 * @throws SQLException
	 */
	public void update_service(HashMap map) throws SQLException {
		getSqlMapClient().update("room.insert_service", map);
	}
	
	/**
	 * 객실 편의시설 삭제
	 * @param room_pk
	 * @throws SQLException
	 */
	public void delete_service(int room_pk) throws SQLException {
		getSqlMapClient().delete("room.delete_service", room_pk);
	}
	
	
	public static void main(String[]args )throws SQLException {
		RoomVO vo = new RoomVO();
		RoomDAO dao = new RoomDAO();
		dao.list(vo);
	}	
	
}
