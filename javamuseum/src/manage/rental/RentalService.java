package manage.rental;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import email.SendMail;
import property.SiteProperty;
import util.FileUtil;
import util.Page;

@Service
public class RentalService {

	@Autowired
	private RentalDAO rentalDao;
	
	public int[] count(RentalVO vo) throws Exception {
		int rowCount = rentalDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(RentalVO vo) throws Exception {
		ArrayList list = rentalDao.list(vo);
		return list;
	}
	
	public RentalVO read(int no) throws SQLException {
		RentalVO vo = rentalDao.read(no);
		return vo;
	}
	
	public int insert(RentalVO vo, HttpServletRequest request) throws Exception {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file = (MultipartFile)fileMap.get("filename_tmp");
		if(!file.isEmpty()) {
			fu.upload(file,  SiteProperty.RENTAL_UPLOAD_PATH, SiteProperty.REAL_PATH, "rental");
			vo.setFilename(fu.getName());
			vo.setFilename_org(fu.getSrcName());
		}
		
		int no = rentalDao.insert(vo);
		return no;
	}
	
	public int update(RentalVO vo) throws Exception {
		RentalVO read = rentalDao.read(vo.getNo());
		String email = read.getEmail();
		String contents = read.getContents();
		int no = rentalDao.update(vo);
		SendMail.sendEmail("handrush@naver.com", email, "테스트메일", contents);
		return no;
	}
}
