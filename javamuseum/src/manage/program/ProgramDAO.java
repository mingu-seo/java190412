package manage.program;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class ProgramDAO extends SqlMapClientDAOSupport {

	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */

	public int count(ProgramVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("program.count", vo);
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(ProgramVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("program.list", vo);
	}

	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo ProgramVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(ProgramVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("program.insert",vo);
	}

//	/**
//	 * 수정
//	 * @param vo
//	 * @throws SQLException
//	 */
//	public int update(ProgramVO vo) throws SQLException {
//		return getSqlMapClient().update("program.update", vo);
//	}
//	
//	public int updateReadno(ProgramVO vo) throws SQLException {
//		return getSqlMapClient().update("program.updateReadno", vo);
//	}
//
	/**
	 * 상세 (readno 수정을 위해 테이블명 필요)
	 * @param vo
	 * @param userCon(조회수)
	 * @return
	 * @throws SQLException
	 */
	public ProgramVO read(ProgramVO vo) throws SQLException {
		return (ProgramVO)getSqlMapClient().queryForObject("program.read", vo);
	}

	/**
	 * 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(ProgramVO vo) throws SQLException {
		return getSqlMapClient().delete("program.delete", vo);
	}

//
//	/**
//	 * 메인목록 조회
//	 * @param tablename 테이블명
//	 * @param number 로우수
//	 * @return ArrayList
//	 * @throws SQLException
//	 */
//	public ArrayList mainList(ProgramVO vo) throws SQLException {
//		return (ArrayList)getSqlMapClient().queryForList("program.mainList", vo);
//	}
}
