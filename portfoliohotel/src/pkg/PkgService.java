package pkg;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.notice.NoticeVO;
import property.SiteProperty;
import util.FileUtil;
import util.Function;
import util.Page;

@Service
public class PkgService {
	
	@Autowired
	private PkgDAO pkgDao;
	
	public int[] count(PkgVO vo) throws Exception {
		int rowCount = pkgDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	public ArrayList list(PkgVO vo) throws Exception {
		ArrayList list = pkgDao.list(vo);
		return list;
	}	
	
	public int insert(PkgVO vo, HttpServletRequest request) throws SQLException, IOException {
		int no = pkgDao.insert(vo);
		return no;
	}
	
	public PkgVO read(int no) throws SQLException {
		PkgVO vo = pkgDao.read(no);
		return vo;
	}
	
	public int update(PkgVO vo, HttpServletRequest request) throws SQLException, IOException {
		PkgVO data = pkgDao.read(vo.getNo());
		int cnt = pkgDao.update(vo);
		
		return cnt;
	}
	
	public int delete(int no) throws SQLException {
		int cnt = pkgDao.delete(no);
		return cnt;
	}
	
	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += pkgDao.delete(nos);
		}
		return r;
	}

}
