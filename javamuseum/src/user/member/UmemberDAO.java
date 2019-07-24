package user.member;

import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.member.MemberVO;

@Repository
public class UmemberDAO extends SqlMapClientDAOSupport {
	
	public int loginCheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("umember.loginCheck", param);
	}
	
	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.loginSessionInfo", param);
	}
}
