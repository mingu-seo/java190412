package dining;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import dining.DiningVO;

@Repository
public class DiningDAO extends SqlMapClientDAOSupport {

	public ArrayList list(DiningVO vo) throws SQLException {
		return (ArrayList) getSqlMapClient().queryForList("dining.list", vo);
	}

	public int count(DiningVO vo) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("dining.count", vo);
	}

	public int insert(DiningVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("dining.insert", vo);

	}
}
