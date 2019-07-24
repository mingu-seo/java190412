package manage.review;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.review.ReviewDAO;
import manage.review.ReviewVO;
import util.Page;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDao;
	
	public int[] count(ReviewVO param) throws SQLException {
		int rowCount = reviewDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(ReviewVO param) throws SQLException {
		ArrayList list = reviewDao.list(param);
		return list;
	}

	public int insert(ReviewVO vo) throws SQLException {
		int no = reviewDao.insert(vo);
		return no;
	}

	public int update(ReviewVO vo) throws SQLException {
		int cnt = reviewDao.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = reviewDao.delete(no);
		return cnt;
	}

	public ReviewVO read(int no) throws SQLException {
		ReviewVO vo = reviewDao.read(no);
		return vo;
	}

//	public boolean loginCheck(ReviewVO param) throws SQLException {
//		int cnt = reviewDao.loginCheck(param);
//		boolean result = false;
//		if (cnt == 1) {
//			result = true;
//		}
//		return result;
//	}
//
//	public ReviewVO getLoginSessionInfo(ReviewVO param) throws SQLException {
//		ReviewVO vo = reviewDao.getLoginSessionInfo(param);
//		vo.setIp(param.getIp());	// 아이피 추가
//		return vo;
//	}
//
//	public int[] countLoginHistory(ReviewVO param) throws SQLException {
//		int rowCount = reviewDao.countLoginHistory(param);
//		int[] rowPageCount = new int[2];
//		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
//		rowPageCount[0] = rowCount;
//		rowPageCount[1] = pageCount;
//		return rowPageCount;
//	}
//
//	public ArrayList listLoginHistory(ReviewVO param) throws SQLException {
//		ArrayList list = reviewDao.listLoginHistory(param);
//		return list;
//	}
//
//	public void insertLoginHistory(ReviewVO param) throws SQLException {
//		reviewDao.insertLoginHistory(param);
//	}

	public int idcheck(ReviewVO param) throws SQLException {
		return reviewDao.idcheck(param);
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += reviewDao.delete(nos);
		}
		return r;
	}
	
}