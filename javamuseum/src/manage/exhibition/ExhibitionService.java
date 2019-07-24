package manage.exhibition;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.CodeUtil;
import util.FileUtil;
import util.Function;
import util.Page;

@Service
public class ExhibitionService {

	@Autowired
	private ExhibitionDAO exhibitionDao;
	
	public ArrayList ingList(ExhibitionVO param) throws Exception {
		ArrayList ingList = exhibitionDao.ingList(param);
		return ingList;
	}
	
	public ArrayList list(ExhibitionVO param, HttpServletRequest request) throws Exception {
		String[] stateNo = request.getParameterValues("sstate");
		ArrayList list = new ArrayList();
		
		
		if(stateNo != null && stateNo.length > 0) {
			param.setSstate(stateNo);
		}
		
		list = exhibitionDao.list(param);
		return list;
	}
	
	public int[] count(ExhibitionVO param) throws Exception {
		int rowCount = exhibitionDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	public int insert(ExhibitionVO param, HttpServletRequest request) throws Exception {
		param.setState(CodeUtil.getDisState(param.getStartdate(), param.getEnddate()));
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file = (MultipartFile)fileMap.get("imagename_tmp");
		if(!file.isEmpty()) {
			fu.upload(file,  SiteProperty.EXHIBITION_UPLOAD_PATH, SiteProperty.REAL_PATH, "exhibition");
			param.setImagename(fu.getName());
		}
		
		int lastNo = (Integer)exhibitionDao.insert(param);
		
		return lastNo;
	}
	
	public int update(ExhibitionVO param, HttpServletRequest request) throws Exception {
		param.setState(CodeUtil.getDisState(param.getStartdate(), param.getEnddate()));
		ExhibitionVO data = exhibitionDao.read(param.getNo());
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file = (MultipartFile)fileMap.get("imagename_tmp");
		if(!file.isEmpty()) {
			fu.upload(file,  SiteProperty.EXHIBITION_UPLOAD_PATH, SiteProperty.REAL_PATH, "exhibition");
			param.setImagename(fu.getName());
		}
		int r = (Integer)exhibitionDao.update(param);
		if(r > 0) {
			if("1".equals(param.getImagename_chk()) || !"".equals(Function.checkNull(param.getImagename()))) {
				Function.fileDelete(param.getUploadPath(), data.getImagename());
			}
		}
		return r;
	}
	
	public ExhibitionVO read(int no) throws SQLException {
		ExhibitionVO param = exhibitionDao.read(no);
		return param;
	}
	
	public int delete(ExhibitionVO param) throws Exception {
		ExhibitionVO data = exhibitionDao.read(param.getNo());
		int r = exhibitionDao.delete(param.getNo());
		if(r > 0) {
			Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.EXHIBITION_UPLOAD_PATH, data.getImagename());
		}
		
		return r;
	}
	
	public int groupDelete(ExhibitionVO param, HttpServletRequest request) throws Exception {
		String[] nos = request.getParameterValues("no");
		int delCount = 0;
		if(nos.length > 0) {
			for(int i = 0; i < nos.length; i++) {
				ExhibitionVO nvo = new ExhibitionVO();
				nvo.setNo(Function.getIntParameter(nos[i]));
				ExhibitionVO data = exhibitionDao.read(nvo.getNo());
				int r = exhibitionDao.delete(Integer.parseInt(nos[i]));
				if(r > 0) {
					delCount++;
					Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.EXHIBITION_UPLOAD_PATH, data.getImagename());
				}
			}
		}
		return delCount;
	}
}
