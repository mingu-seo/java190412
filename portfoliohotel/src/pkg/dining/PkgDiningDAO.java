package pkg.dining;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.notice.NoticeVO;
import db.SqlMapClientDAOSupport;

@Repository
public class PkgDiningDAO extends SqlMapClientDAOSupport{
	
	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(PkgDiningVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("pkgdining.count", vo);
	}
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(PkgDiningVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("pkgdining.list", vo);
	}

}
