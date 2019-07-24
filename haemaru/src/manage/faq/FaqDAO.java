package manage.faq;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class FaqDAO extends SqlMapClientDAOSupport {

	public int count(FaqVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("faq.count", param);
	}
	

	/**
	 * 관리자 목록 조회
	 * @param param
	 * @return ArrayList<AdoptVO>
	 * @throws SQLException
	 */
	
	public ArrayList list(FaqVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("faq.list", param);
	}

	/**
	 * 관리자 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(FaqVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("faq.insert", vo);
	}

	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(FaqVO vo) throws SQLException {
		return getSqlMapClient().update("faq.update", vo);
	}

	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("faq.delete", no);
	}

	/**
	 * 관리자 상세
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public FaqVO read(int no) throws SQLException {
		return (FaqVO)getSqlMapClient().queryForObject("faq.read", no);
	}

	/**
	 * 관리자 로그인체크
	 * id, password로 조회 후 존재하면 true 리턴
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
	public int loginCheck(FaqVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("faq.loginCheck", param);
	}
	
	/**
	 * 관리자 아이디체크
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public int idcheck(FaqVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("faq.idcheck", param);
	}
//
//	public FaqVO getLoginSessionInfo(FaqVO param) throws SQLException {
//		return (FaqVO) getSqlMapClient().queryForObject("faq.loginSessionInfo", param);
//	}
//
//	/**
//	 * 관리자 접속 기록 rowPageCount
//	 * @param param
//	 * @return rowPageCount배열 (전체로우수, 페이지수)
//	 * @throws SQLException
//	 */
//	public int countLoginHistory(FaqVO param) throws SQLException {
//		return (Integer)getSqlMapClient().queryForObject("faq.countLoginHistory", param);
//	}
//
//	/**
//	 * 관리자 접속기록 리스트
//	 * @param param
//	 * @return ArrayList
//	 * @throws SQLException
//	 */
//	public ArrayList listLoginHistory(FaqVO param) throws SQLException {
//		return (ArrayList)getSqlMapClient().queryForList("faq.listLoginHistory", param);
//	}

//	/**
//	 * 로그인 시 히스토리 저장
//	 * @param param
//	 * @return int
//	 * @throws SQLException  
//	 */
//	public void insertLoginHistory(FaqVO param) throws SQLException {
//		getSqlMapClient().insert("faq.insertLoginHistory", param);
//	}

	
	public static void main(String[] args) throws Exception {
		FaqDAO ad = new FaqDAO();
		FaqVO av = new FaqVO(10);
		int a = ad.count(av);
		System.out.println(a);
	}
}
