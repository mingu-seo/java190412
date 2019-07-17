package board.notice;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.notice.NoticeVO;
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
	
	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo NoticeVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(NoticeVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("notice.insert",vo);
	}
	
	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("notice.delete", no);
	}
	
	public NoticeVO read(int no) throws SQLException {
		return (NoticeVO)getSqlMapClient().queryForObject("notice.read", no);
	}

}
