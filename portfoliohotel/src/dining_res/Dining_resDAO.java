package dining_res;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;	

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

}
