package pet;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.admin.AdminVO;
import util.Page;

@Service
public class PetService {
	
	@Autowired
	private PetDAO petDAO;
	
	public int[] count(PetVO param) throws SQLException {
		int rowCount = petDAO.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(PetVO param) throws SQLException {
		ArrayList list = petDAO.list(param);
		return list;
	}

	public int insert(PetVO vo) throws SQLException {
		int no = petDAO.insert(vo);
		return no;
	}

	public int update(PetVO vo) throws SQLException {
		int cnt = petDAO.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = petDAO.delete(no);
		return cnt;
	}

	public PetVO read(int no) throws SQLException {
		PetVO vo = petDAO.read(no);
		return vo;
	}
	
	public boolean loginCheck(PetVO vo) throws SQLException {
		int cnt = petDAO.loginCheck(vo);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}

	public PetVO getLoginSessionInfo(PetVO vo) throws SQLException {
		return vo;
	}

	public int idcheck(String id) throws SQLException {
		int cnt=petDAO.idcheck(id);
		
		return cnt; 
	}
	
	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += petDAO.delete(nos);
		}
		return r;
	}
	
}
