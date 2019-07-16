package manage.program;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;
import util.Page;

@Service
public class ProgramService {

	@Autowired
	private ProgramDAO programDao;
	
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
		MultipartFile file= (MultipartFile)fileMap.get("filename_tmp");
//		if (!file.isEmpty()) {
//			fu.upload(file, SiteProperty.NOTICE_UPLOAD_PATH, SiteProperty.REAL_PATH, "notice");
//			vo.setFilename(fu.getName());
//			vo.setFilename_org(fu.getSrcName());
//			vo.setFilesize(fu.getSrcSize());
//		}
//	}
		
		int lastNo = (Integer)programDao.insert(vo);
		
		return lastNo;
	}

//	}
//	
//	public ProgramVO read(int no) throws Exception {
//		ProgramVO vo = programDao.read(no);
//		}
//		return vo;
//	}
//
//	public int update(ProgramVO vo) throws Exception {
//		ProgramVO data = programDao.read(vo);
//		int r = (Integer)programDao.update(vo);
//		if(r > 0){
//			if("1".equals(vo.getFilename_chk()) || !"".equals(Function.checkNull(vo.getFilename()))){
//				Function.fileDelete(vo.getUploadPath(), data.getFilename());
//			}
//		}
//		return r;
//	}
//
//	
//	public int delete(int no) throws Exception {
//		int vo = programDao.delete(no);
//		return vo;
//	}
//	
//	public int groupDelete(ProgramVO vo, HttpServletRequest request) throws Exception {
//		String[] nos = request.getParameterValues("no");
//		int delCount = 0;
//		if (nos.length > 0) {
//			for (int i=0; i<nos.length; i++) {
//				ProgramVO nvo = new ProgramVO();
//				nvo.setNo(Function.getIntParameter(nos[i]));
//				ProgramVO data = programDao.read(vo);
//				int r = programDao.delete(vo);
//				if (r > 0) {
//					delCount++;
//					Function.fileDelete(vo.getUploadPath(), data.getFilename());
//				}
//			}
//		}
//		return delCount;
//	}

	/*
	public ArrayList mainList(ProgramVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
*/
}
