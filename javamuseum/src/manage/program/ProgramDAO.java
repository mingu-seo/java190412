package manage.program;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;


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
	   
	public void insertOption(HashMap map) throws SQLException {
		getSqlMapClient().insert("program.insertOption", map);
	}
	   
	public ArrayList<HashMap> listOption(int program_pk) throws SQLException{
		return (ArrayList<HashMap>)getSqlMapClient().queryForList("program.listOption", program_pk);
	}
	   
	public int deleteOption(int program_pk) throws SQLException {
		return getSqlMapClient().delete("program.deleteOption", program_pk);
	}
	
	   public static void main(String[] args) throws SQLException {
		      ProgramDAO ad = new ProgramDAO();
		      ProgramVO av = new ProgramVO();
		      ad.count(av);
		      ad.list(av);
		      av.setTitle("dd");
		      av.setContents("ddd");
//		      av.setName("dayeong");
		      int no = ad.insert(av);
//		      int cnt = ad.idcheck("dayeong1234");
//		      System.out.println(cnt);
		      
		      HashMap m = new HashMap();
		      m.put("program_pk", 160);
		      m.put("time", 1);
		      m.put("date", 1);
		      ad.insertOption(m);
		      
//		      ArrayList<HashMap> list = pd.listOption(268);
//		      
//		      for(int i=0; i<list.size(); i++) {
//		         System.out.println("상품명 : " + list.get(i).get("title")+"상품명 : " + list.get(i).get("price"));
//		      }
//		     pd.deleteOption(9999);
		      
//		      pd.reviewDelete(159);
		      
		   }


}