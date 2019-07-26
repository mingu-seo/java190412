package board.qna;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.qna.QnaVO;
import db.SqlMapClientDAOSupport;



@Repository
public class QnaDAO extends SqlMapClientDAOSupport {
		
	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	
	
	public int count(QnaVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("qna.count", vo);
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	
	public ArrayList list(QnaVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("qna.list", vo);
	}
	
	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo NoticeVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(QnaVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("qna.insert",vo);
	}
	
	public int update(QnaVO vo) throws SQLException {
		return getSqlMapClient().update("qna.update", vo);
	}

	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(QnaVO vo) throws SQLException {
		return getSqlMapClient().delete("qna.delete", vo);
	}

	/**
	 * 관리자 상세
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public QnaVO read(QnaVO vo) throws SQLException {
		return (QnaVO)getSqlMapClient().queryForObject("qna.read", vo);
	}

	/**
	 * 관리자 로그인체크
	 * id, password로 조회 후 존재하면 true 리턴
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
	
	/* 관리자 답변  쓰기, 수정*/ 
	public int updateReply(QnaVO vo) throws SQLException {
		return (Integer)getSqlMapClient().update("qna.updateReply",vo);
	}
	
	/* 관리자 답변  삭제 */
	public int deleteReply(QnaVO vo) throws SQLException {
		return getSqlMapClient().delete("qna.deleteReply", vo);
	}
	
	
	
	public static void main(String[] args) throws Exception {
		QnaDAO ad = new QnaDAO();
		QnaVO av = new QnaVO(10);
		/* av.setName("test"); */
		//ad.read(1);
	
		
	}

	
}
