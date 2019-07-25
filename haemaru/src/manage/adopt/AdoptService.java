package manage.adopt;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.Page;

@Service
public class AdoptService {
	
	@Autowired
	private AdoptDAO adoptDao;
	
	public int[] count(AdoptVO param) throws SQLException {
		int rowCount = adoptDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(AdoptVO param) throws SQLException {
		ArrayList list = adoptDao.list(param);
		return list;
	}

	public int insert(AdoptVO vo) throws SQLException {
		int no = adoptDao.insert(vo);
		return no;
	}

	public int update(AdoptVO vo) throws SQLException {
		int cnt = adoptDao.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = adoptDao.delete(no);
		return cnt;
	}

	public AdoptVO read(int no) throws SQLException {
		AdoptVO vo = adoptDao.read(no);
		return vo;
	}

	public boolean loginCheck(AdoptVO param) throws SQLException {
		int cnt = adoptDao.loginCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}

//	public AdoptVO getLoginSessionInfo(AdoptVO param) throws SQLException {
//		AdoptVO vo = adoptDao.getLoginSessionInfo(param);
//		vo.setIp(param.getIp());	// 아이피 추가
//		return vo;
//	}

//	public int[] countLoginHistory(AdoptVO param) throws SQLException {
//		int rowCount = adoptDao.countLoginHistory(param);
//		int[] rowPageCount = new int[2];
//		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
//		rowPageCount[0] = rowCount;
//		rowPageCount[1] = pageCount;
//		return rowPageCount;
//	}
//
//	public ArrayList listLoginHistory(AdoptVO param) throws SQLException {
//		ArrayList list = adoptDao.listLoginHistory(param);
//		return list;
//	}
//
//	public void insertLoginHistory(AdoptVO param) throws SQLException {
//		adoptDao.insertLoginHistory(param);
//	}

	public int idcheck(AdoptVO param) throws SQLException {
		return adoptDao.idcheck(param);
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += adoptDao.delete(nos);
		}
		return r;
	}
	
}
