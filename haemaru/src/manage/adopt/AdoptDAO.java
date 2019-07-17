package manage.adopt;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class AdoptDAO extends SqlMapClientDAOSupport {

	public int count(AdoptVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("adopt.count", param);
	}
	

	/**
	 * 관리자 목록 조회
	 * @param param
	 * @return ArrayList<AdoptVO>
	 * @throws SQLException
	 */
	
	public ArrayList list(AdoptVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("adopt.list", param);
	}

	/**
	 * 관리자 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(AdoptVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("adopt.insert", vo);
	}

	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(AdoptVO vo) throws SQLException {
		return getSqlMapClient().update("adopt.update", vo);
	}

	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("adopt.delete", no);
	}

	/**
	 * 관리자 상세
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public AdoptVO read(int no) throws SQLException {
		return (AdoptVO)getSqlMapClient().queryForObject("adopt.read", no);
	}

	/**
	 * 관리자 로그인체크
	 * id, password로 조회 후 존재하면 true 리턴
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
	public int loginCheck(AdoptVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("adopt.loginCheck", param);
	}
	
	/**
	 * 관리자 아이디체크
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public int idcheck(AdoptVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("adopt.idcheck", param);
	}

	public AdoptVO getLoginSessionInfo(AdoptVO param) throws SQLException {
		return (AdoptVO) getSqlMapClient().queryForObject("adopt.loginSessionInfo", param);
	}

	/**
	 * 관리자 접속 기록 rowPageCount
	 * @param param
	 * @return rowPageCount배열 (전체로우수, 페이지수)
	 * @throws SQLException
	 */
	public int countLoginHistory(AdoptVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("adopt.countLoginHistory", param);
	}

	/**
	 * 관리자 접속기록 리스트
	 * @param param
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList listLoginHistory(AdoptVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("adopt.listLoginHistory", param);
	}

	/**
	 * 로그인 시 히스토리 저장
	 * @param param
	 * @return int
	 * @throws SQLException  
	 */
	public void insertLoginHistory(AdoptVO param) throws SQLException {
		getSqlMapClient().insert("adopt.insertLoginHistory", param);
	}

	
//	public static void main(String[] args) throws Exception {
//		AdoptDAO ad = new AdoptDAO();
//		AdoptVO av = new AdoptVO(10);
//		av.setName("test");
//		int a = ad.idcheck(av);
//		System.out.println(a);
//	}
}
