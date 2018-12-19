package se;

import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Graduate{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	int total_grade=0;
	public Graduate(){
		
	}
	
	/* 학생 - 졸업자가진단*/
	public int graduation_diagnosis(String id) throws Exception{
		
		conn = getConnection();
		sql = "select count(*) from subject , course where course.id = ? && course.subject_number = subject.subject_number && course.score !='0' ";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			total_grade = Integer.parseInt(rs.getString("count(*)"));
			return total_grade;
		}
		else{
			return total_grade;
		}
		
	}
	public Connection getConnection() throws Exception{
		String jdbcUrl = "jdbc:mysql://localhost:3306/se_term";
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection(jdbcUrl, "root", "asdasd1");
		return conn;
	}
}
