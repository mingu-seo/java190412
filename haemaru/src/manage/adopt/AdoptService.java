package manage.adopt;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.FileUtil;
import util.Function;
import util.Page;

@Service
public class AdoptService {
	
	@Autowired
	private AdoptDAO adoptDao;
	
	public int[] count(AdoptVO param) throws SQLException {
		int rowCount = adoptDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(AdoptVO param) throws SQLException {
		ArrayList list = adoptDao.list(param);
		return list;
	}

	public int insert(AdoptVO vo, HttpServletRequest request) throws Exception {

		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file = (MultipartFile) fileMap.get("imagename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.ANIMAL_UPLOAD_PATH, SiteProperty.REAL_PATH, "adopt");
			vo.setAnimal_image(fu.getName());
			vo.setAnimal_image_org(fu.getSrcName());

		}
		int r = (Integer) adoptDao.insert(vo);
		return r;
	}

	public int update(AdoptVO vo, HttpServletRequest request) throws Exception {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file = (MultipartFile) fileMap.get("imagename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.ANIMAL_UPLOAD_PATH, SiteProperty.REAL_PATH, "adopt");
			vo.setAnimal_image(fu.getName());
			vo.setAnimal_image_org(fu.getSrcName());

		}

		AdoptVO data = adoptDao.read(vo.getNo());
		int r = (Integer)adoptDao.update(vo);
		if (r > 0) {
			if ("1".equals(vo.getImagename_chk()) || !"".equals(Function.checkNull(vo.getAnimal_image()))) {
				System.out.println(vo.getUploadPath());
				System.out.println(data.getAnimal_image());
				Function.fileDelete(vo.getUploadPath(), data.getAnimal_image());
			}
		}
		return r;

	}
	public int delete(int no) throws SQLException {
		int cnt = adoptDao.delete(no);
		return cnt;
	}

	public AdoptVO read(int no) throws SQLException {
		AdoptVO vo = adoptDao.read(no);
		return vo;
	}

	public boolean loginCheck(AdoptVO param) throws SQLException {
		int cnt = adoptDao.loginCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}

//	public AdoptVO getLoginSessionInfo(AdoptVO param) throws SQLException {
//		AdoptVO vo = adoptDao.getLoginSessionInfo(param);
//		vo.setIp(param.getIp());	// 아이피 추가
//		return vo;
//	}

//	public int[] countLoginHistory(AdoptVO param) throws SQLException {
//		int rowCount = adoptDao.countLoginHistory(param);
//		int[] rowPageCount = new int[2];
//		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
//		rowPageCount[0] = rowCount;
//		rowPageCount[1] = pageCount;
//		return rowPageCount;
//	}
//
//	public ArrayList listLoginHistory(AdoptVO param) throws SQLException {
//		ArrayList list = adoptDao.listLoginHistory(param);
//		return list;
//	}
//
//	public void insertLoginHistory(AdoptVO param) throws SQLException {
//		adoptDao.insertLoginHistory(param);
//	}

	public int idcheck(AdoptVO param) throws SQLException {
		return adoptDao.idcheck(param);
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += adoptDao.delete(nos);
		}
		return r;
	}
	
}
