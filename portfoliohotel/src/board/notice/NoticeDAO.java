package board.notice;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.notice3.NoticeVO3;
import db.SqlMapClientDAOSupport;

@Repository
public class NoticeDAO extends SqlMapClientDAOSupport{
	
	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(NoticeVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("notice.count", vo);
	}
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(NoticeVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("notice.list", vo);
	}

}
