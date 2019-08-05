package room.res;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

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
	public ArrayList index(Room_resVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("room_res.index", vo);
	}
	
	public ArrayList<HashMap> list(String yearMonth) throws SQLException {
		return (ArrayList<HashMap>)getSqlMapClient().queryForList("room_res.list", yearMonth);
	}
	
	public ArrayList<HashMap> check(HashMap map) throws SQLException {
		return (ArrayList<HashMap>)getSqlMapClient().queryForList("room_res.check", map);
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
	
	/**
	 * 객실 예약 수정
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int update(Room_resVO vo) throws SQLException {
		return getSqlMapClient().update("room_res.edit", vo);
	}
	
	/**
	 * 객실 예약 취소
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public int cancel(int no) throws SQLException {
		return getSqlMapClient().update("room_res.cancel", no);
	}
	
	/**
	 * 객실 예약 삭제
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("room_res.delete", no);
	}
	
	/**
	 * 객실 예약 개수 카운트
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(Room_resVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("room_res.count", vo);
	}
	
	/**
	 * 객실 추가 옵션 예약
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public void insert_opt(Room_opt_resVO vo) throws SQLException {
		getSqlMapClient().insert("room_res.insert_opt", vo);
	}
	
	/**
	 * 객실 추가 옵션 목록
	 * @param room_res_pk
	 * @return
	 * @throws SQLException
	 */
	public ArrayList list_opt(int room_res_pk) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("room_res.list_opt", room_res_pk);
	}
	
	public static void main(String[] args) throws Exception {
		Room_resDAO dao = new Room_resDAO();
		Room_resVO vo = new Room_resVO();
		HashMap hm = new HashMap();
		hm.put("checkin", "2019-07-01");
		hm.put("checkout", "2019-07-04");
		dao.check(hm);
//		vo.setCategory(1);
	}
}
