package manage.program;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import manage.reservation.ReservationDAO;
import manage.reservation.ReservationVO;
import property.SiteProperty;
import util.FileUtil;
import util.Page;

@Service
public class ProgramService {
	
	@Autowired
	private ProgramDAO programDao;
	@Autowired
	private ReservationDAO reservationDao;
	
	public int[] count(ProgramVO vo) throws Exception {
		int rowCount = programDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	
	public ArrayList list(ProgramVO vo) throws Exception {
		ArrayList list = programDao.list(vo);
		
		return list;
	}
	
	public int insert(ProgramVO vo, HttpServletRequest request) throws Exception {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("imagename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.PROGRAM_UPLOAD_PATH, SiteProperty.REAL_PATH, "program");
			vo.setImagename(fu.getName());
		}
		
		int lastNo = (Integer)programDao.insert(vo);
		
		return lastNo;
	}
	
	public int update(ProgramVO vo, HttpServletRequest request) throws SQLException, IOException {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("imagename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.PROGRAM_UPLOAD_PATH, SiteProperty.REAL_PATH, "program");
			vo.setImagename(fu.getName());
		}
		int cnt = programDao.update(vo);
		return cnt;
	}
	
	public ProgramVO read(int no) throws SQLException {
		ProgramVO vo = programDao.read(no);
		return vo;
	}
	
	public int delete(int no) throws SQLException {
		int cnt = programDao.delete(no);
		return cnt;
	}
	
	public int groupDelete(HttpServletRequest request) throws Exception {
		String[] nos = request.getParameterValues("no");
		int delCount = 0;
		if (nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				int no = Integer.parseInt(nos[i]);
				delCount += programDao.delete(no);
			
			}
		}
		return delCount;
	}
	
	public ArrayList<HashMap> listOption(int program_pk) throws Exception {
	      ArrayList<HashMap> list = programDao.listOption(program_pk);
	      
	      return list;
	   }
	
	public void insertOption(HttpServletRequest request, int program_pk) throws SQLException {
	      String[] date = request.getParameterValues("date");
	      String[] time = request.getParameterValues("time");
	      
	      int optSize =	date.length;
	      for (int i = 0; i < optSize; i++) {
	         HashMap m = new HashMap();
	         m.put("program_pk", program_pk);
	         m.put("date", date[i]);
	         m.put("time", time[i]);
	         programDao.insertOption(m);
	      }
	   }
	
	public int deleteOption(int program_pk) throws SQLException{
			int cnt = programDao.deleteOption(program_pk);
			return cnt;		
	}
	

}
