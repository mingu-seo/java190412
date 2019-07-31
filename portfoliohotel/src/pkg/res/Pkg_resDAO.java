package pkg.res;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.notice.NoticeVO;
import db.SqlMapClientDAOSupport;
import pkg.PkgVO;

@Repository
public class Pkg_resDAO extends SqlMapClientDAOSupport{
	
	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(Pkg_resVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("pkg_res.count", vo);
	}
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(Pkg_resVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("pkg_res.list", vo);
	}
	
	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo NoticeVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(Pkg_resVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("pkg_res.insert",vo);
	}
	
	/*
	 * public Pkg_resVO read(int no) throws SQLException { return
	 * (Pkg_resVO)getSqlMapClient().queryForObject("pkg.read", no); }
	 */
	
	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	/*
	 * public int update(Pkg_resVO vo) throws SQLException { return
	 * getSqlMapClient().update("pkg.update", vo); }
	 */
	
	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	/*
	 * public int delete(int no) throws SQLException { return
	 * getSqlMapClient().delete("pkg.delete", no); }
	 */

}
