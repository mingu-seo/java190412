package member;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.admin.AdminVO;
import member.MypetVO;
import util.Page;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public int[] count(MemberVO param) throws SQLException {
		int rowCount = memberDAO.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(MemberVO param) throws SQLException {
		ArrayList list = memberDAO.list(param);
		return list;
	}

	public int insert(MemberVO vo) throws SQLException {
		int no = memberDAO.insert(vo);
		return no;
	}

	public int update(MemberVO vo) throws SQLException {
		int cnt = memberDAO.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = memberDAO.delete(no);
		return cnt;
	}

	public MemberVO read(int no) throws SQLException {
		MemberVO vo = memberDAO.read(no);
		return vo;
	}
	
	public boolean loginCheck(MemberVO vo) throws SQLException {
		int cnt = memberDAO.loginCheck(vo);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}

	public MemberVO getLoginSessionInfo(MemberVO vo) throws SQLException {
		return vo;
	}

	public int idcheck(String id) throws SQLException {
		int cnt=memberDAO.idcheck(id);
		
		return cnt; 
	}
	
	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += memberDAO.delete(nos);
		}
		return r;
	}
	
	public ArrayList<MypetVO> mypetList(int member_pk) throws Exception {
		return memberDAO.mypetList(member_pk);
	}
	
	public void insertLoginHistory(MemberVO vo) throws SQLException {
		memberDAO.insertLoginHistory(vo);
	}
	
}
