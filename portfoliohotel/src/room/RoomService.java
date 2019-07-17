package room;

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

@Service
public class RoomService {

	@Autowired
	private RoomDAO roomDAO;
	
//	객실
	public ArrayList list(RoomVO vo) throws Exception{
		ArrayList list = roomDAO.list(vo);
		return list;
	}
	
	public int insert(RoomVO vo, HttpServletRequest req) throws Exception{	
		String[] arr = new String[10];
		String[] arr_org = new String[10];
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(req);
		
		for(int i=0; i<10; i++) {
		MultipartFile file= (MultipartFile)fileMap.get("image_tmp"+i);
			if (!file.isEmpty()) {
				fu.upload(file, SiteProperty.ROOM_UPLOAD_PATH, SiteProperty.REAL_PATH, "room");
					arr[i] = fu.getName();
					arr_org[i] = fu.getSrcName();					
			}
		}
	
		if(arr[0] != null) {
			vo.setImage1(arr[0]);
			vo.setImage_org1(arr_org[0]);
		}
		if(arr[1] != null) {
			vo.setImage2(arr[1]);
			vo.setImage_org2(arr_org[1]);
		}
		if(arr[2] != null) {
			vo.setImage3(arr[2]);
			vo.setImage_org3(arr_org[2]);
		}
		if(arr[3] != null) {
			vo.setImage4(arr[3]);
			vo.setImage_org4(arr_org[3]);
		}
		if(arr[4] != null) {
			vo.setImage5(arr[4]);
			vo.setImage_org5(arr_org[4]);
		}
		if(arr[5] != null) {
			vo.setImage6(arr[5]);
			vo.setImage_org6(arr_org[5]);
		}
		if(arr[6] != null) {
			vo.setImage7(arr[6]);
			vo.setImage_org7(arr_org[6]);
		}
		if(arr[7] != null) {
			vo.setImage8(arr[7]);
			vo.setImage_org8(arr_org[7]);
		}
		if(arr[8] != null) {
			vo.setImage9(arr[8]);
			vo.setImage_org9(arr_org[8]);
		}
		if(arr[9] != null) {
			vo.setImage10(arr[9]);
			vo.setImage_org10(arr_org[9]);
		}	
			
		int lastNo = (Integer)roomDAO.insert(vo);
		return lastNo;
	}
	
	public RoomVO read(RoomVO vo) throws SQLException {
		RoomVO read = roomDAO.read(vo);
		return read;
	}
	
	public int update(RoomVO vo, HttpServletRequest req) throws Exception {
		RoomVO read = roomDAO.read(vo);
		String[] arr = new String[10];
		String[] arr_org = new String[10];
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(req);
		
		for(int i=0; i<10; i++) {
			int j = i+1;
		MultipartFile file= (MultipartFile)fileMap.get("image_tmp"+j);
			if (!file.isEmpty()) {
				fu.upload(file, SiteProperty.ROOM_UPLOAD_PATH, SiteProperty.REAL_PATH, "room");
					arr[i] = fu.getName();
					arr_org[i] = fu.getSrcName();					
			}
		}
	
		if(arr[0] != null) {
			vo.setImage1(arr[0]);
			vo.setImage_org1(arr_org[0]);
		}
		if(arr[1] != null) {
			vo.setImage2(arr[1]);
			vo.setImage_org2(arr_org[1]);
		}
		if(arr[2] != null) {
			vo.setImage3(arr[2]);
			vo.setImage_org3(arr_org[2]);
		}
		if(arr[3] != null) {
			vo.setImage4(arr[3]);
			vo.setImage_org4(arr_org[3]);
		}
		if(arr[4] != null) {
			vo.setImage5(arr[4]);
			vo.setImage_org5(arr_org[4]);
		}
		if(arr[5] != null) {
			vo.setImage6(arr[5]);
			vo.setImage_org6(arr_org[5]);
		}
		if(arr[6] != null) {
			vo.setImage7(arr[6]);
			vo.setImage_org7(arr_org[6]);
		}
		if(arr[7] != null) {
			vo.setImage8(arr[7]);
			vo.setImage_org8(arr_org[7]);
		}
		if(arr[8] != null) {
			vo.setImage9(arr[8]);
			vo.setImage_org9(arr_org[8]);
		}
		if(arr[9] != null) {
			vo.setImage10(arr[9]);
			vo.setImage_org10(arr_org[9]);
		}
		
		
		int r = roomDAO.update(vo);
		if(r > 0) {
			if("1".equals(vo.getImage_chk1()) || !"".equals(Function.checkNull(vo.getImage1()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage1());
			}
			if("1".equals(vo.getImage_chk2()) || !"".equals(Function.checkNull(vo.getImage2()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage2());
			}
			if("1".equals(vo.getImage_chk3()) || !"".equals(Function.checkNull(vo.getImage3()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage3());
			}
			if("1".equals(vo.getImage_chk4()) || !"".equals(Function.checkNull(vo.getImage4()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage4());
			}
			if("1".equals(vo.getImage_chk5()) || !"".equals(Function.checkNull(vo.getImage5()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage5());
			}
			if("1".equals(vo.getImage_chk6()) || !"".equals(Function.checkNull(vo.getImage6()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage6());
			}
			if("1".equals(vo.getImage_chk7()) || !"".equals(Function.checkNull(vo.getImage7()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage7());
			}
			if("1".equals(vo.getImage_chk8()) || !"".equals(Function.checkNull(vo.getImage8()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage8());
			}
			if("1".equals(vo.getImage_chk9()) || !"".equals(Function.checkNull(vo.getImage9()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage9());
			}
			if("1".equals(vo.getImage_chk10()) || !"".equals(Function.checkNull(vo.getImage10()))) {
				Function.fileDelete(SiteProperty.ROOM_UPLOAD_PATH, read.getImage10());
			}
		}
		return r;
	}
	
	public int delete(RoomVO vo) throws SQLException {
		RoomVO read = roomDAO.read(vo);
		int r = roomDAO.delete(vo);
		
		return r;
	}
	
	public int groupDelete(RoomVO vo, HttpServletRequest req) throws Exception {
		String[] nos = req.getParameterValues("no");
		int delCount = 0;
		if(nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				RoomVO rvo = new RoomVO();
				rvo.setNo(Function.getIntParameter(nos[i]));
				RoomVO read = roomDAO.read(rvo);
				int r = roomDAO.delete(rvo);
				if(r > 0) {
					delCount++;
				}
			}			
		}
		return delCount;
	}
	
	
	
//	객실 옵션
	public ArrayList list_opt(Room_optVO vo) throws Exception{
		ArrayList list_opt = roomDAO.list_opt(vo);
		return list_opt;
	}
	
	public int insert_opt(Room_optVO vo, HttpServletRequest req) throws Exception{	
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(req);
		MultipartFile file= (MultipartFile)fileMap.get("imagename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.ROOM_OPT_UPLOAD_PATH, SiteProperty.REAL_PATH, "room_opt");
			vo.setImage(fu.getName());
			vo.setImage_org(fu.getSrcName());
		}
		
		int lastNo = (Integer)roomDAO.insert_opt(vo);
		return lastNo;
	}
	
	public int update_opt(Room_optVO vo, HttpServletRequest req) throws Exception {
		int r = roomDAO.update_opt(vo);
		return r;
	}
	
	public int delete_opt(Room_optVO vo) throws SQLException {
		Room_optVO read = roomDAO.read_opt(vo);
		int r = roomDAO.delete_opt(vo);
		
		return r;
	}
	
	public int groupDelete_opt(Room_optVO vo, HttpServletRequest req) throws Exception {
		String[] nos = req.getParameterValues("no");
		int delCount = 0;
		if(nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				Room_optVO rvo = new Room_optVO();
				rvo.setNo(Function.getIntParameter(nos[i]));
				Room_optVO read = roomDAO.read_opt(rvo);
				int r = roomDAO.delete_opt(rvo);
				if(r > 0) {
					delCount++;
				}
			}			
		}
		return delCount;
	}
	
	
	
//	편의시설
	public ArrayList list_service(Room_serviceVO vo) throws Exception{
		ArrayList list_service = roomDAO.list_service(vo);
		return list_service;
	}
}
