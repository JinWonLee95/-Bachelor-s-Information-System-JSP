package se;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Scholarship {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	String scholarship_type="";
	public Scholarship(){
		
	}
	
	/*관리자 - 전체 학생의 성적 보여주기*/
	public ResultSet[] manage_scholarship() throws Exception{
		ResultSet[] rs = new ResultSet[2];
		conn = getConnection();
		sql ="select id,sum(score)/count(*) , count(*) from course group by id order by sum(score)/count(*) desc";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		rs[0] = pstmt.executeQuery();
		
		sql = "select count(c.id) from (select id,sum(score)/count(*) from course group by id order by sum(score)/count(*) desc) as c";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		rs[1] = pstmt.executeQuery();
		
		if( rs[0].next() ){
			rs[0].previous();
			return rs;
		}
		else{
			return rs;
		}
		
	}
	/*성적이 모두부여됬느지확인*/
	public boolean check_givegrade(String id) throws Exception{

		sql ="select * from course where id= ? && grade = ''";
		conn = getConnection();
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(sql);
		if(rs.next()){
			return false;
		}
		else{
			return true;
		}
		
	}
	/*관리자 - 전체 학생의 장학등록*/
	public int give_scholarship(String id , String kind) throws Exception{
			conn = getConnection();
			sql ="update scholarship set scholarship_kind =? where id=?";
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, kind);
			pstmt.setString(2, id);
			
			int result = pstmt.executeUpdate();
			if( result == 1 ){
				return 1;
			}
			else{
				return 0;
			}
	
	}
	
	/*학생 - 장학여부 확인*/
	public String check_scholarship(String id) throws Exception{
		conn = getConnection();
		sql ="select * from scholarship where id =?";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, id);
		 rs = pstmt.executeQuery();
		if( rs.next()){
			 scholarship_type = rs.getString("scholarship_kind");
			return scholarship_type;
		}
		else{
			return scholarship_type;
		}
	}
	
	public Connection getConnection() throws Exception{
		String jdbcUrl = "jdbc:mysql://localhost:3306/se_term?useUnicode=true&characterEncoding=utf8";
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection(jdbcUrl, "root", "asdasd1");
		return conn;
	}
}
