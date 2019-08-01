package pkg.res;

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
public class Pkg_resService {
	
	@Autowired
	private Pkg_resDAO pkg_resDao;
	
	public int[] count(Pkg_resVO vo) throws Exception {
		int rowCount = pkg_resDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	public ArrayList list(Pkg_resVO vo) throws Exception {
		ArrayList list = pkg_resDao.list(vo);
		return list;
	}	
	
	
	  public int insert(Pkg_resVO vo, HttpServletRequest request) throws SQLException, IOException { 
		  int no = pkg_resDao.insert(vo); 
		  
		  return no; 
	  }
	 
	
	/*
	 * public Pkg_resVO read(int no) throws SQLException { Pkg_resVO vo =
	 * pkgDao.read(no); return vo; }
	 */
	
	/*
	 * public int update(Pkg_resVO vo, HttpServletRequest request) throws
	 * SQLException, IOException { Pkg_resVO data = pkgDao.read(vo.getNo()); int cnt
	 * = pkgDao.update(vo);
	 * 
	 * return cnt; }
	 */
	
	/*
	 * public int delete(int no) throws SQLException { int cnt = pkgDao.delete(no);
	 * return cnt; }
	 */
	
	/*
	 * public int groupDelete(HttpServletRequest request) throws SQLException {
	 * String[] no = request.getParameterValues("no"); int r = 0; for (int i=0;
	 * i<no.length; i++) { int nos = Integer.parseInt(no[i]); r +=
	 * pkgDao.delete(nos); } return r; }
	 */

}
