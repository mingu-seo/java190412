package test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class TestDAO extends SqlMapClientDAOSupport {
	
	public ArrayList getList() throws SQLException {
		ArrayList list = (ArrayList) getSqlMapClient().queryForList("test.select");
		return list;
	}
	
	public static void main(String[] args) throws Exception {
		int[] res_hour = new int[3];
		res_hour[0] = 0;
		res_hour[1] = 2;
		res_hour[2] = 1;
		
		System.out.println(Arrays.binarySearch(res_hour, 2));
	}

}
