package board.faq;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class FaqDAO extends SqlMapClientDAOSupport {
	
	public int count(FaqVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("faq.count", vo);
	}

	public ArrayList list(FaqVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("faq.list", vo);
	}

	public int insert(FaqVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("faq.insert",vo);
	}

	public int update(FaqVO vo) throws SQLException {
		return getSqlMapClient().update("faq.update", vo);
	}
	
	public int updateReadno(FaqVO vo) throws SQLException {
		return getSqlMapClient().update("faq.updateReadno", vo);
	}

	public FaqVO read(FaqVO vo) throws SQLException {
		return (FaqVO)getSqlMapClient().queryForObject("faq.read", vo);
	}

	public int delete(FaqVO vo) throws SQLException {
		return getSqlMapClient().delete("faq.delete", vo);
	}
	
	public static void main(String[] args) throws SQLException{
		FaqDAO dao = new FaqDAO();
		FaqVO vo = new FaqVO();

		
		
	}
	
	
	
}
