package manage.doctor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import manage.doctor.sched.SchedDAO;
import manage.doctor.sched.SchedVO;
import mypet.MypetVO;
import property.SiteProperty;
import util.FileUtil;
import util.Function;
import util.Page;

@Service
public class DoctorService {

	@Autowired
	private DoctorDAO doctorDao;
	@Autowired
	private SchedDAO sDao;

	public int[] count(DoctorVO param) throws SQLException {
		int rowCount = doctorDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(DoctorVO param) throws SQLException {
		ArrayList list = doctorDao.list(param);
		return list;
	}

	public int insert(DoctorVO vo, HttpServletRequest request) throws Exception {

		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file = (MultipartFile) fileMap.get("image_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.DOCTOR_UPLOAD_PATH, SiteProperty.REAL_PATH, "doctor");
			vo.setDoc_image(fu.getName());
			vo.setDoc_image_org(fu.getSrcName());

		}
		int lastNo = (Integer) doctorDao.insert(vo);
		SchedVO svo = new SchedVO();
		svo.setDoctor_pk(lastNo);
		svo.setName(vo.getName());
		sDao.insert(svo);
		return lastNo;
	}

	public DoctorVO read(int no) throws SQLException {
		DoctorVO vo = doctorDao.read(no);
		return vo;
	}

	public int update(DoctorVO vo, HttpServletRequest request) throws Exception {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file = (MultipartFile) fileMap.get("image_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.DOCTOR_UPLOAD_PATH, SiteProperty.REAL_PATH, "doctor");
			vo.setDoc_image(fu.getName());
			vo.setDoc_image_org(fu.getSrcName());

		}

		DoctorVO data = doctorDao.read(vo.getNo());
		int r = (Integer) doctorDao.update(vo);
		if (r > 0) {
			if ("1".equals(vo.getDoc_imagename_chk()) || !"".equals(Function.checkNull(vo.getDoc_image()))) {
				System.out.println(vo.getUploadPath());
				System.out.println(data.getDoc_image());
				Function.fileDelete(vo.getUploadPath(), data.getDoc_image());
			}
		}

		return r;

	}

	public int delete(int no) throws SQLException {
		int cnt = doctorDao.delete(no);
		if(cnt > 0 ){
			sDao.delete(no);
		}
		return cnt;

	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i = 0; i < no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += doctorDao.delete(nos);
			if(r > 0) {
				sDao.delete(nos);
				}
		}
		return r;
	}

	public ArrayList<DoctorVO> Intro(DoctorVO param) throws Exception {
		return doctorDao.Intro(param);
	}
	
}
