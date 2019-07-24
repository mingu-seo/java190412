package dining_res;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import dining.DiningVO;	

@Repository
public class Dining_resDAO extends SqlMapClientDAOSupport {
	
	public ArrayList list(Dining_resVO vo) throws SQLException {
		return (ArrayList) getSqlMapClient().queryForList("dining_res.list", vo);
	}
	
	public int count(Dining_resVO vo) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("dining_res.count", vo);
	}
	
	public int insert(Dining_resVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("dining_res.insert", vo);

	}

	public int update(Dining_resVO vo) throws SQLException {
		return getSqlMapClient().update("dining_res.update", vo);
	}
	
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("dining_res.delete", no);
	}
	
	public Dining_resVO read(int no) throws SQLException {
		return (Dining_resVO) getSqlMapClient().queryForObject("dining_res.read", no);
	}

}
