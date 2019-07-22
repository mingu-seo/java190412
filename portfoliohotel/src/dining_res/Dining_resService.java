package dining_res;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dining.DiningVO;
import manage.admin.AdminVO;
import util.Page;

@Service
public class Dining_resService {
	
	@Autowired
	private Dining_resDAO dining_resDao;

	public int[] count(Dining_resVO vo) throws Exception {
		int rowCount = dining_resDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(Dining_resVO vo) throws Exception {
		ArrayList list = dining_resDao.list(vo);
		return list;
	}
	
	public int insert(Dining_resVO vo) throws SQLException {
		int no = dining_resDao.insert(vo);
		return no;
	}
	
	public int update(Dining_resVO vo) throws SQLException {
		int cnt = dining_resDao.update(vo);
		return cnt;
	}
	
	public int delete(int no) throws SQLException {
		int cnt = dining_resDao.delete(no);
		return cnt;
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i = 0; i < no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += dining_resDao.delete(nos);
		}
		return r;
	}
	
	public Dining_resVO read(int no) throws SQLException {
		Dining_resVO vo = dining_resDao.read(no);
		return vo;
	}

}
