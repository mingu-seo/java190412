package board.member;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;


@Repository
public class MemberDAO extends SqlMapClientDAOSupport {

	public int count(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.count", param);
	}

	/**
	 * 관리자 목록 조회
	 * 
	 * @param param
	 * @return ArrayList<AdminVO>
	 * @throws SQLException
	 */

	public ArrayList list(MemberVO param) throws SQLException {
		return (ArrayList) getSqlMapClient().queryForList("member.list", param);
	}

	/**
	 * 관리자 등록
	 * 
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(MemberVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("member.insert", vo);
	}

	
//	  public int insert(Member_serviceVO vo) throws SQLException { return (Integer)
//	  getSqlMapClient().insert("member_service.insert", vo); }
//	  
//	  public int insert(Member_loginVO vo) throws SQLException { return (Integer)
//	  getSqlMapClient().insert("member_login.insert", vo); }
	 

	/**
	 * 관리자 수정
	 * 
	 * @param vo
	 * @throws SQLException
	 */
	public int update(MemberVO vo) throws SQLException {
		return getSqlMapClient().update("member.update", vo);
	}

	/**
	 * 관리자 삭제
	 * 
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("member.delete", no);
	}

	/**
	 * 관리자 상세
	 * 
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public MemberVO read(int no) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.read", no);
	}
	
	public MemberVO loginForm(int no) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.loginForm", no);
	}
	public MemberVO memberEdit(int no) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.memberEdit", no);
	}


	/**
	 * 관리자 로그인체크 id, password로 조회 후 존재하면 true 리턴
	 * 
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
	public int loginCheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.loginCheck", param);
	}
	


	/**
	 * 관리자 아이디체크
	 * 
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	
	public int idcheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.idcheck", param);
	}
	
	public int emailcheck(String email) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.emailcheck", email);
	}
	public int pwdcheck(String pwd) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.pwdcheck", pwd);
	}
	
	public int samePwdcheck(String samePwd) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.samePwdcheck", samePwd);
	}

	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.loginSessionInfo", param);
	}
	
	

	

	public static void main(String[] args) throws Exception {
		MemberDAO ad = new MemberDAO();
		MemberVO av = new MemberVO();
//		ad.count(av);
//		ad.list(av);
//		av.setEmail("hahc1");
//		av.setPassword("ha1234");
//		ad.loginCheck(av);
//		av.setName("하희철");
//		int no =ad.insert(av);
//		System.out.println(no);

	}

	
}
