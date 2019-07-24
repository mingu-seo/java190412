package manage.exhibition;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.ticket.TicketVO;

@Repository
public class ExhibitionDAO extends SqlMapClientDAOSupport {

	public ArrayList list(ExhibitionVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("exhibition.preList", param);
	}
	
	public int count(ExhibitionVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("exhibition.count", param);
	}
	
	public int insert(ExhibitionVO param) throws SQLException {
		return (Integer)getSqlMapClient().insert("exhibition.insert", param);
	}
	
	public ExhibitionVO read(int no) throws SQLException {
		return (ExhibitionVO)getSqlMapClient().queryForObject("exhibition.read", no);
	}
	
	public int update(ExhibitionVO param) throws SQLException {
		return getSqlMapClient().update("exhibition.update", param);
	}
	
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("exhibition.delete", no);
	}
	
	public ArrayList ingList(ExhibitionVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("exhibition.ingList", param);
	}
	
	public static void main(String[] args) throws Exception {
		ExhibitionDAO dao = new ExhibitionDAO();
		ExhibitionVO vo = new ExhibitionVO();
		
	}
}
