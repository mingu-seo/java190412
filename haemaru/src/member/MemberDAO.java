package member;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.admin.AdminVO;
import member.MypettVO;

@Repository
public class MemberDAO extends SqlMapClientDAOSupport {

	public int count(MemberVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("member.count", param);
	}
	

	/**
	 * 회원 목록 조회
	 * @param param
	 * @return ArrayList<AdminVO>
	 * @throws SQLException
	 */
	
	public ArrayList list(MemberVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("member.list", param);
	}

	/**
	 * 회원 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(MemberVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("member.insert", vo);
	}

	/**
	 * 회원 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(MemberVO vo) throws SQLException {
		return getSqlMapClient().update("member.update", vo);
	}

	/**
	 * 회원 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("member.delete", no);
	}

	/**
	 * 회원 상세
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public MemberVO read(int no) throws SQLException {
		return (MemberVO)getSqlMapClient().queryForObject("member.read", no);
	}

	/**
	 * 회원 로그인체크
	 * id, password로 조회 후 존재하면 true 리턴
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
	
	public int loginCheck(MemberVO vo) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.loginCheck", vo);
	}
	
	public void insertLoginHistory(MemberVO vo) throws SQLException {
		getSqlMapClient().insert("member.insertLoginHistory", vo);
	}
	
	/**
	 * 관리자 아이디체크
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public int idcheck(String email) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.idcheck", email);
	}

	
	public MemberVO checkMember(MemberVO vo) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.checkMember", vo);
	}
	
	
	public MemberVO getLoginSessionInfo(MemberVO vo) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.loginSessionInfo", vo);
	}
	
	public ArrayList<MypettVO> mypetList(int member_pk) throws SQLException {
		return (ArrayList<MypettVO>)getSqlMapClient().queryForList("member.mypetList", member_pk);
	}
	
	public static void main(String[] args) throws Exception {
		MemberDAO ad = new MemberDAO();
		MemberVO av = new MemberVO();
	}
}
