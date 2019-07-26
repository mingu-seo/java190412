package board.review;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class ReviewDAO extends SqlMapClientDAOSupport {

	
	public ArrayList list(ReviewVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("review.list", param);
	}

	/**
	 * 관리자 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(ReviewVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("review.insert", vo);
	}

	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(ReviewVO vo) throws SQLException {
		return getSqlMapClient().update("review.update", vo);
	}

	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("review.delete", no);
	}

	/**
	 * 관리자 상세
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public ReviewVO read(int no) throws SQLException {
		return (ReviewVO)getSqlMapClient().queryForObject("review.read", no);
	}

	/**
	 * 관리자 로그인체크
	 * id, password로 조회 후 존재하면 true 리턴
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
	public int loginCheck(ReviewVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("review.loginCheck", param);
	}
	
	/**
	 * 관리자 아이디체크
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public int idcheck(ReviewVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("review.idcheck", param);
	}

	public ReviewVO getLoginSessionInfo(ReviewVO param) throws SQLException {
		return (ReviewVO) getSqlMapClient().queryForObject("review.loginSessionInfo", param);
	}

	/**
	 * 관리자 접속 기록 rowPageCount
	 * @param param
	 * @return rowPageCount배열 (전체로우수, 페이지수)
	 * @throws SQLException
	 */
	public int countLoginHistory(ReviewVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("review.countLoginHistory", param);
	}

	/**
	 * 관리자 접속기록 리스트
	 * @param param
	 * @return ArrayList
	 * @throws SQLException
	 */
//	public ArrayList listLoginHistory(ReviewVO param) throws SQLException {
//		return (ArrayList)getSqlMapClient().queryForList("review.listLoginHistory", param);
//	}

	/**
	 * 로그인 시 히스토리 저장
	 * @param param
	 * @return int
	 * @throws SQLException  
	 */
//	public void insertLoginHistory(ReviewVO param) throws SQLException {
//		getSqlMapClient().insert("review.insertLoginHistory", param);
//	}

}
