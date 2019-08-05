package manage.reserve;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.doctor.DoctorVO;
import manage.doctor.sched.SchedVO;
import util.CodeUtil;
import util.DateUtil;

@Repository
public class ReserveDao extends SqlMapClientDAOSupport {

	public int count(ReserveVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("reserve.count", param);
	}

	/**
	 * 예약 목록 조회
	 * 
	 * @param param
	 * @return ArrayList<ReserveVO>
	 * @throws SQLException
	 */
	public ArrayList list(ReserveVO param) throws SQLException {
		return (ArrayList) getSqlMapClient().queryForList("reserve.list", param);
	}
	
	/**
	 * 예약 등록
	 * 
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(ReserveVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("reserve.insert", vo);
	}

	/**
	 * 예약 수정
	 * 
	 * @param vo
	 * @throws SQLException
	 */
	public int update(ReserveVO vo) throws SQLException {
		return getSqlMapClient().update("reserve.update", vo);
	}

	/**
	 * 예약 삭제
	 * 
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("reserve.delete", no);
	}

	/**
	 * 예약 상세
	 * 
	 * @param i
	 * @return
	 * @throws SQLException
	 */
	public ReserveVO read(int i) throws SQLException {
		return (ReserveVO) getSqlMapClient().queryForObject("reserve.read", i);
	}
	
	public ArrayList doctorList(HashMap hm) throws SQLException {
		return (ArrayList) getSqlMapClient().queryForList("reserve.doctorList", hm);
	}

	public SchedVO schedList(SchedVO param) throws SQLException {
		return (SchedVO) getSqlMapClient().queryForObject("reserve.sched", param);
	}

	public ArrayList reservedTime(ReserveVO param) throws SQLException {
		return (ArrayList) getSqlMapClient().queryForList("reserve.reservedTime", param);
	}

	public ArrayList<ReserveVO> reservation(ReserveVO param) throws SQLException {
		return (ArrayList<ReserveVO>) getSqlMapClient().queryForList("reserve.reservation", param);
	}

	public void reserveInsert(ReserveVO vo) throws SQLException {
		getSqlMapClient().insert("reserve.reserveInsert", vo);
	}

	public static void main(String[] args) throws Exception {
		ReserveDao dao = new ReserveDao();
		ReserveVO vo = new ReserveVO();
	}
}
