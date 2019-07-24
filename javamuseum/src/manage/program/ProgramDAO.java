package manage.program;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;


@Repository
public class ProgramDAO extends SqlMapClientDAOSupport {

	public int count(ProgramVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("program.count", param);
	}
	   
	public ArrayList list(ProgramVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("program.list", param);
	}
	
	public int insert(ProgramVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("program.insert", vo);
	}
	
	public int update(ProgramVO vo) throws SQLException {
		return getSqlMapClient().update("program.update", vo);
	}
	
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("program.delete", no);
	}
	
	public ProgramVO read(int i) throws SQLException {
		return (ProgramVO)getSqlMapClient().queryForObject("program.read", i);
	}
	   
	public void insertOption(HashMap map) throws SQLException {
		getSqlMapClient().insert("program.insertOption", map);
	}
	   
	public ArrayList<HashMap> listOption(int program_pk) throws SQLException{
		return (ArrayList<HashMap>)getSqlMapClient().queryForList("program.listOption", program_pk);
	}
	   
	public int deleteOption(int program_pk) throws SQLException {
		return getSqlMapClient().delete("program.deleteOption", program_pk);
	}

}