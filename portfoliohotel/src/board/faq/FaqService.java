package board.faq;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import db.SqlMapClientDAOSupport;
import util.Page;

@Service
public class FaqService extends SqlMapClientDAOSupport {
	
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
	
	public int insert(FaqVO vo, HttpServletRequest request) throws SQLException, IOException {

		int no = faqDao.insert(vo);
		return no;
	}
	
	public int update(FaqVO vo, HttpServletRequest request) throws SQLException, IOException {

		FaqVO data = faqDao.read(vo.getNo());
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
