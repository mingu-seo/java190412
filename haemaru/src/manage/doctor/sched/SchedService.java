package manage.doctor.sched;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.Function;
import util.Page;
import manage.doctor.sched.*;

@Service
public class SchedService {

	@Autowired
	private SchedDAO schedDao;

	public int[] count(SchedVO param) throws SQLException {
		int rowCount = schedDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(SchedVO param) throws SQLException {
		ArrayList list = schedDao.list(param);
		return list;
	}

	public int insert(SchedVO vo, HttpServletRequest request) throws Exception {
		int lastNo = (Integer) schedDao.insert(vo);
		return lastNo;
	}

	public SchedVO read(int no) throws SQLException {
		SchedVO vo = schedDao.read(no);
		return vo;
	}

	public int update(SchedVO vo, HttpServletRequest request) throws Exception {
		SchedVO data = schedDao.read(vo.getNo());
		int r = (Integer) schedDao.update(vo);
		return r;
	}

	public int delete(int no) throws SQLException {
		int cnt = schedDao.delete(no);
		return cnt;
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i = 0; i < no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += schedDao.delete(nos);
		}
		return r;
	}
	
}
