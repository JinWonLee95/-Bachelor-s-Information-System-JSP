package se;

import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Subject {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	
	public Subject(){
		
	}
	
	/*전체 - 수강편람 조회*/
	public ResultSet show_Allsubject() throws Exception{
		conn = getConnection();
		sql = "select * from subject";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		if(rs.next()){
			rs.previous();
			return rs;
		}
		return rs;
	}
	
	
	/*교수 - 강의 등록*/
	public boolean regist_subject(String subejct_name , String professor_name ,int grade, int personnel,String time, String day , String place) throws Exception{
		String subject_number = "18-"+(find_subjectcount()+1);
		String t[] = time.split("~");
		conn = getConnection();
		sql = "insert into subject values(?,?,?,?,?,?,?,?,?)";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, subject_number);
		pstmt.setString(2, subejct_name);
		pstmt.setString(3, professor_name);
		pstmt.setString(4, t[0]);
		pstmt.setString(5, t[1]);
		pstmt.setString(6, day);
		pstmt.setInt(7, grade);
		pstmt.setString(8, place);
		pstmt.setInt(9,personnel);
		int result = pstmt.executeUpdate();
		
		
		if(result == 0 ){
			return false;
		}
		else{
			return true;
		}
		
		
	}
	/*전체인원*/
	public int total_countSubject(String subject_num) throws Exception{
		conn = getConnection();
		sql = "select personnel from subject where subject_number = ?";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, subject_num);
		rs = pstmt.executeQuery();
		if(rs.next()){
			return Integer.parseInt(rs.getString("personnel"));
		}
		else{
			return Integer.parseInt(rs.getString("personnel"));
		}
	}
	int apply_result =0;
	public int getApply_result(){
		return apply_result;
	}
	/*학생 - 강의신청*/
	public boolean course_subject(String id , String subject_num,String subject_name) throws Exception{
		if(!check_mysubject(id, subject_num,subject_name)){
			if(find_applycount(subject_num) < total_countSubject(subject_num) ){
			conn = getConnection();
			sql = "insert into course values(?,?,?,?)";
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, subject_num);
			pstmt.setString(3, "");
			pstmt.setInt(4,0);
			pstmt.executeUpdate();
			return true;
			}
			else{
				apply_result =1;
				return false;
			}
		}
		else{
			return false;
		}
	}
	
	/*신청 강의가 있는지 확인*/
	private boolean check_mysubject(String id , String subject_num,String subject_name) throws Exception{
		conn = getConnection();
		sql = "select * from course , subject where course.id =? && ( course.subject_number = ? or ( course.subject_number = subject.subject_number && subject.subject_name = ?));";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, subject_num);
		pstmt.setString(3, subject_name);
		rs = pstmt.executeQuery();
		if( rs.next()){
			return true;
		}
		else{
			return false;
		}
	}
	/*강의실 등록가능여부 */
	public boolean check_room(String time,String day, String place) throws Exception{
		String t[] = time.split("~");
		conn = getConnection();
		sql = "select * from subject where ( (? > start_time and ? < end_time) or (? > start_time and ? < end_time) or ( ? < start_time && end_time < ?) ) && day = ? && place =?;";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, t[0]);
		pstmt.setString(2, t[0]);
		pstmt.setString(3, t[1]);
		pstmt.setString(4, t[1]);
		pstmt.setString(5, t[0]);
		pstmt.setString(6, t[1]);
		pstmt.setString(7, day);
		pstmt.setString(8,place);
		rs = pstmt.executeQuery();
		if(rs.next()){
			return true;
		}
		else{
			return false;
		}
		
	}
	
	
	/*시간표 확인*/
	public ResultSet view_timetable(String id) throws Exception{
		conn = getConnection();
		sql = "select * from subject , course where course.id = ? && course.subject_number = subject.subject_number";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			rs.previous();
			return rs;
		}
		else{
			return rs;
		}
		
	}
	/* 학생 - 수강취소 */
	public boolean cancel_subject(String id , String subject_num) throws Exception{
			conn = getConnection();
			sql = "delete from course where id =? && subject_number = ?";
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, subject_num);
			int result = pstmt.executeUpdate();
			if( result == 1 ){
				return true;
			}
			else{
				return false;
			}
	}
	/*교수 - 자신의 강의 목록*/
	public ResultSet show_mylecture(String id) throws Exception{
		conn = getConnection();
		sql = "select * from  subject where professor_name = ?";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			rs.previous();
			return rs;
		}
		else{
			return rs;
		}
	}
	/*강의를 신청한 학생 수 */
	public int find_applycount(String subject_number) throws Exception{
		conn = getConnection();
		sql = "select count(*) from course where subject_number = ?";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, subject_number);
		rs = pstmt.executeQuery();
		if(rs.next()){
			return Integer.parseInt(rs.getString("count(*)"));
		}
		else{
			return Integer.parseInt(rs.getString("count(*)"));
		}
		
	}
	
	/*등록된 강의 수*/
	private int find_subjectcount() throws Exception {
		conn = getConnection();
		sql = "select count(*) from subject";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			return Integer.parseInt(rs.getString("count(*)"));
		}
		else{
			return Integer.parseInt(rs.getString("count(*)"));
		}
	}
	public Connection getConnection() throws Exception{
		String jdbcUrl = "jdbc:mysql://localhost:3306/se_term?useUnicode=true&characterEncoding=utf8";
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection(jdbcUrl, "root", "asdasd1");
		return conn;
	}
}
