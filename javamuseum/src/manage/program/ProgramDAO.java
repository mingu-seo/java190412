package manage.program;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.reservation.ReservationDAO;
import manage.reservation.ReservationVO;


@Repository
public class ProgramDAO extends SqlMapClientDAOSupport {

	public int count(ProgramVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("program.count", param);
	}
	   
	public ArrayList list(ProgramVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("program.list", param);
	}
	
	public int insert(ProgramVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("program.insert", vo);
	}
	
	public int update(ProgramVO vo) throws SQLException {
		return getSqlMapClient().update("program.update", vo);
	}
	
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("program.delete", no);
	}
	
	public ProgramVO read(int i) throws SQLException {
		return (ProgramVO)getSqlMapClient().queryForObject("program.read", i);
	}

	public ArrayList<HashMap> listOption(int program_pk) throws SQLException{
		return (ArrayList<HashMap>)getSqlMapClient().queryForList("program.listOption", program_pk);
	}
	
	public void insertOption(HashMap map) throws SQLException {
		getSqlMapClient().insert("program.insertOption", map);
	}
	   
	public int deleteOption(int program_pk) throws SQLException {
		return getSqlMapClient().delete("program.deleteOption", program_pk);
	}

	public int countMember(ReservationVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("program.countMember", vo);
	}
	   public static void main(String[] args) throws SQLException {
		      ProgramDAO pd = new ProgramDAO();
		      ProgramVO av = new ProgramVO();
		      ReservationVO pv = new ReservationVO();
		      av.setContents("asd");
		      pd.update(av);
//		      pd.countMember(pv);
//		      pv.setDate("d");
//		      pv.setMember_pk(1);
//		      av.setName("dayeong");
//		    int no = pd.insert(pv);
//		      int cnt = ad.idcheck("dayeong1234");
//		      System.out.println(cnt);
		      
//		      HashMap m = new HashMap();
//		      m.put("product_pk",1);
//		      m.put("title", "테스트옵션");
//		      m.put("price", 99119);
//		      pd.insertOption(m);
//		      ArrayList<HashMap> list = pd.listOption(99);
//		      
//		      for(int i=0; i<list.size(); i++) {
//		         System.out.println("상품명 : " + list.get(i).get("time")+"상품명 : " + list.get(i).get("date"));
//		      }
//		     pd.deleteOption(9999);
		      
//		      pd.reviewDelete(159);
		      
		   }

}