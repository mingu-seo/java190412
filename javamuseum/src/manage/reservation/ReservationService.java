package manage.reservation;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.FileUtil;
import util.Page;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationDAO reservationDao;
	
	public int[] count(ReservationVO vo) throws Exception {
		int rowCount = reservationDao.count(vo);
		int[] rowPageCount = new int[2];
		
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(ReservationVO vo) throws Exception {
		ArrayList list = reservationDao.list(vo);
		
		return list;
	}
	
	public int insert(ReservationVO vo, HttpServletRequest request) throws Exception {
		FileUtil fu = new FileUtil();
		
		int lastNo = (Integer)reservationDao.insert(vo);
		
		return lastNo;
	}
	
	public int update(ReservationVO vo, HttpServletRequest request) throws SQLException, IOException {
		FileUtil fu = new FileUtil();
		int cnt = reservationDao.update(vo);
		return cnt;
	}
	
	public ReservationVO read(int no) throws SQLException {
		ReservationVO vo = reservationDao.read(no);
		return vo;
	}
	
	public int delete(int no) throws SQLException {
		int cnt = reservationDao.delete(no);
		return cnt;
	}
	
	public int groupDelete(HttpServletRequest request) throws Exception {
		String[] nos = request.getParameterValues("no");
		int delCount = 0;
		if (nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				int no = Integer.parseInt(nos[i]);
				delCount += reservationDao.delete(no);
			
			}
		}
		return delCount;
	}

}
