package board.faq;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class FaqDAO extends SqlMapClientDAOSupport {
	
	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(FaqVO vo) throws SQLException {
		return getSqlMapClient().update("faq.update", vo);
	}
	
	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("faq.delete", no);
	}
	
	public int count(FaqVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("faq.count", param);
	}
	
	public ArrayList list(FaqVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("faq.list", param);
	}	

	/**
	 * 관리자 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(FaqVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("faq.insert", vo);
	}
	
	public FaqVO read(int no) throws SQLException {
		return (FaqVO)getSqlMapClient().queryForObject("faq.read", no);
	}
}
