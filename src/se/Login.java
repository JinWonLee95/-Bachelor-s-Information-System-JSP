package se;
import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Login {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	int fail_reason = 0;
	int authority=0;
	int current =0;
	public Login(){
		
	}
	public int getFail_reason(){
		return fail_reason;
	}
	public int getAuthority(){
		return authority;
	}
	public int getCurrent(){
		return current;
	}
	
	public boolean check(String id , String pwd) throws Exception{
		boolean login_confirm = false;
		
		conn = getConnection();
		sql = "select password , authority , current from member where id = ?";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if( rs.next()){
			if(rs.getString("password").equals(pwd)){
				//로그인 성공
				authority =	rs.getInt("authority");
				current = rs.getInt("current");
				login_confirm =  true;
			} else{
				//잘못된 비밀번호
				fail_reason = 1;
			}
		} else{
	    	fail_reason= 2;
	    	//잘못된 아이디
	    }
		
		return login_confirm;
	}
	
	public Connection getConnection() throws Exception{
		String jdbcUrl = "jdbc:mysql://localhost:3306/se_term?useUnicode=true&characterEncoding=utf8";
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection(jdbcUrl, "root", "asdasd1");
		return conn;
	}
}
