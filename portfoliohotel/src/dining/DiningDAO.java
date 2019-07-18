package dining;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

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

	public int update(DiningVO vo) throws SQLException {
		return getSqlMapClient().update("dining.update", vo);
	}

	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("dining.delete", no);
	}

	public DiningVO read(int no) throws SQLException {
		return (DiningVO) getSqlMapClient().queryForObject("dining.read", no);
	}
}
