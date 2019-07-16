package pet;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class PetDAO extends SqlMapClientDAOSupport {

	public int count(PetVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("pet.count", param);
	}
	

	/**
	 * 회원 목록 조회
	 * @param param
	 * @return ArrayList<AdminVO>
	 * @throws SQLException
	 */
	
	public ArrayList list(PetVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("pet.list", param);
	}

	/**
	 * 회원 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(PetVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("pet.insert", vo);
	}

	/**
	 * 회원 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(PetVO vo) throws SQLException {
		return getSqlMapClient().update("pet.update", vo);
	}

	/**
	 * 회원 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("pet.delete", no);
	}

	/**
	 * 회원 상세
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public PetVO read(int no) throws SQLException {
		return (PetVO)getSqlMapClient().queryForObject("pet.read", no);
	}

	/**
	 * 회원 로그인체크
	 * id, password로 조회 후 존재하면 true 리턴
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
	
	public int loginCheck(PetVO vo) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("pet.loginCheck", vo);
	}
	
	/**
	 * 관리자 아이디체크
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public int idcheck(String id) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("pet.idcheck", id);
	}

	public PetVO getLoginSessionInfo(PetVO vo) throws SQLException {
		return (PetVO) getSqlMapClient().queryForObject("pet.loginSessionInfo", vo);
	}

	
	public static void main(String[] args) throws Exception {
		PetDAO ad = new PetDAO();
		PetVO av = new PetVO();
		int cnt= ad.idcheck("id2");
		System.out.println(cnt);
	}
}
