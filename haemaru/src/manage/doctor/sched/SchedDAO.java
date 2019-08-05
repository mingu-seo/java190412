package manage.doctor.sched;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.admin.AdminVO;
import member.MemberVO;


@Repository
public class SchedDAO extends SqlMapClientDAOSupport {

	public int count(SchedVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("sched.count", param);
	}	

	/**
	 * 회원 목록 조회
	 * @param param
	 * @return ArrayList<AdminVO>
	 * @throws SQLException
	 */
	public ArrayList list(SchedVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("sched.list", param);
	}

	/**
	 * 관리자 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(SchedVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("sched.insert", vo);
		
	}

	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(SchedVO vo) throws SQLException {
		return getSqlMapClient().update("sched.update", vo);
	}

	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("sched.delete", no);
	}

	/**
	 * 일정관리에서 no로 넘어오는 경우
	 * @param i
	 * @return
	 * @throws SQLException
	 */
	public SchedVO read(int i) throws SQLException {
		return (SchedVO)getSqlMapClient().queryForObject("sched.read", i);
	}
	
	// 의료진관리에서 의료진pk로 넘어오는 경우
	public SchedVO readByDoctor(int i) throws SQLException {
		return (SchedVO)getSqlMapClient().queryForObject("sched.readByDoctor", i);
	}
	
	public static void main(String[] args) throws SQLException {
		SchedDAO dao = new SchedDAO();
		SchedVO vo = new SchedVO();
	}
}
