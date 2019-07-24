package manage.faq;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.Page;

@Service
public class FaqService {
	
	@Autowired
	private FaqDAO faqDao;
	
	public int[] count(FaqVO param) throws SQLException {
		int rowCount = faqDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(FaqVO param) throws SQLException {
		ArrayList list = faqDao.list(param);
		return list;
	}

	public int insert(FaqVO vo) throws SQLException {
		int no = faqDao.insert(vo);
		return no;
	}

	public int update(FaqVO vo) throws SQLException {
		int cnt = faqDao.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = faqDao.delete(no);
		return cnt;
	}

	public FaqVO read(int no) throws SQLException {
		FaqVO vo = faqDao.read(no);
		return vo;
	}

	public boolean loginCheck(FaqVO param) throws SQLException {
		int cnt = faqDao.loginCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}

//	public AdoptVO getLoginSessionInfo(AdoptVO param) throws SQLException {
//		AdoptVO vo = faqDao.getLoginSessionInfo(param);
//		vo.setIp(param.getIp());	// 아이피 추가
//		return vo;
//	}

//	public int[] countLoginHistory(FaqVO param) throws SQLException {
//		int rowCount = faqDao.countLoginHistory(param);
//		int[] rowPageCount = new int[2];
//		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
//		rowPageCount[0] = rowCount;
//		rowPageCount[1] = pageCount;
//		return rowPageCount;
//	}
//
//	public ArrayList listLoginHistory(FaqVO param) throws SQLException {
//		ArrayList list = faqDao.listLoginHistory(param);
//		return list;
//	}
//
//	public void insertLoginHistory(FaqVO param) throws SQLException {
//		faqDao.insertLoginHistory(param);
//	}
//
	public int idcheck(FaqVO param) throws SQLException {
		return faqDao.idcheck(param);
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += faqDao.delete(nos);
		}
		return r;
	}
	
}
