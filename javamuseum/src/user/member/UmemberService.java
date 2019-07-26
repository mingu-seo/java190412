package user.member;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.admin.AdminVO;
import manage.member.MemberVO;

@Service
public class UmemberService {
	
	@Autowired
	UmemberDAO umemberDao;
	
	public boolean loginCheck(MemberVO param) throws SQLException {
		int cnt = umemberDao.loginCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}
	
	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
		MemberVO vo = umemberDao.getLoginSessionInfo(param);
		return vo;
	}
	
}
