package mypet;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class MypetDAO extends SqlMapClientDAOSupport {

	public int count(MypetVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("mypet.count", param);
	}
	

	/**
	 * 회원 목록 조회
	 * @param param
	 * @return ArrayList<AdminVO>
	 * @throws SQLException
	 */
	
	public ArrayList list(MypetVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("mypet.list", param);
	}

	/**
	 * 회원 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(MypetVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("mypet.insert", vo);
	}

	/**
	 * 회원 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(MypetVO vo) throws SQLException {
		return getSqlMapClient().update("mypet.update", vo);
	}

	/**
	 * 회원 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("mypet.delete", no);
	}

	/**
	 * 회원 상세
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public MypetVO read(MypetVO vo) throws SQLException {
		return (MypetVO)getSqlMapClient().queryForObject("mypet.read", vo);
	}

	/**
	 * 회원 로그인체크
	 * id, password로 조회 후 존재하면 true 리턴
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */

	
	public static void main(String[] args) throws Exception {
		MypetDAO ad = new MypetDAO();
		MypetVO av = new MypetVO();
	}
}
