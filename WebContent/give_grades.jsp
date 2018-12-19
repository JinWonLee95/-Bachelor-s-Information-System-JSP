<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Main.css?ver=1">
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<%@page import="se.Subject" %>
<%@page import="se.Member" %>
<%@page import="se.Grade" %>
 <%@page import="java.sql.ResultSet" %>  
 <script src="function.js"></script>
</head>
<%request.setCharacterEncoding("utf-8"); %>
<body>
	
	<% 
		String subject_number = request.getParameter("subject_num");
		Member m = new Member();
		Grade g = new Grade();
		
		ResultSet rs = m.course_student(subject_number);

		if(rs.next()){
			rs.previous();
		%>
		
		<nav class="navbar navbar-custom navbar-fixed-top top-nav-collapse" role="navigation">
			<div class="login_container">
					<p class="bold text-right log" > <%=(String)session.getAttribute("id")%> 로그인하셨습니다.</p>
			</div>

        <div class="container navigation">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
       
            </div>

            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
			  <ul class="nav navbar-nav">
				<li class="active"><a href="after_login_professorMain.jsp">Home</a></li>
				<li><a href="regist_subject.jsp">강의등록</a></li>
				<li><a href="show_mylecture.jsp">성적부여</a></li>
				<li><a onclick="logout()" style="cursor:pointer">로그아웃</a></li>
			  </ul>
            </div>
         
        </div>
    </nav>
    <img src="./cnu.jpg" class="back back2">
    <div class="show_box">
		<form action ="give_grades2.jsp">
		<table class="myinformation" >
				<tr>
					<th>
						학번
					</th>
					<th>
						선택
					</th>
				
				</tr>
		<% 
		while(rs.next()){
	%>
			<tr>
				<td>
				<%=  rs.getString("id")%>
				</td>
				<td>
					<select name ="grade" style="width:80px">
							<% if( rs.getString("course.grade").equals("A")){
								
							   %> 
							   <option value="<%= rs.getString("id") %>,A">A</option>
								<option value="<%= rs.getString("id") %>,B">B</option>
								<option value="<%= rs.getString("id") %>,C">C</option>
								<option value="<%= rs.getString("id") %>,D">D</option>
								<option value="<%= rs.getString("id") %>,F">F</option>
							   <%
							}else if( rs.getString("course.grade").equals("B")){
								  %> 
								   <option value="<%= rs.getString("id") %>,B">B</option>
									<option value="<%= rs.getString("id") %>,A">A</option>
									<option value="<%= rs.getString("id") %>,C">C</option>
									<option value="<%= rs.getString("id") %>,D">D</option>
									<option value="<%= rs.getString("id") %>,F">F</option>
								   <%
							}
							else if(rs.getString("course.grade").equals("C") ){
								%> 
								   <option value="<%= rs.getString("id") %>,C">C</option>
									<option value="<%= rs.getString("id") %>,A">A</option>
									<option value="<%= rs.getString("id") %>,B">B</option>
									<option value="<%= rs.getString("id") %>,D">D</option>
									<option value="<%= rs.getString("id") %>,F">F</option>
								   <%
							}else if(rs.getString("course.grade").equals("D") ){
								%> 
								   <option value="<%= rs.getString("id") %>,D">D</option>
									<option value="<%= rs.getString("id") %>,A">A</option>
									<option value="<%= rs.getString("id") %>,B">B</option>
									<option value="<%= rs.getString("id") %>,C">C</option>
									<option value="<%= rs.getString("id") %>,F">F</option>
								   <%
							}else if( rs.getString("grade").equals("F")){
								%> 
								   <option value="<%= rs.getString("id") %>,F">F</option>
									<option value="<%= rs.getString("id") %>,A">A</option>
									<option value="<%= rs.getString("id") %>,B">B</option>
									<option value="<%= rs.getString("id") %>,C">C</option>
									<option value="<%= rs.getString("id") %>,D">D</option>
								   <%
							}else{
								%> 
								   <option value="<%= rs.getString("id") %>,-">-</option>
									<option value="<%= rs.getString("id") %>,A">A</option>
									<option value="<%= rs.getString("id") %>,B">B</option>
									<option value="<%= rs.getString("id") %>,C">C</option>
									<option value="<%= rs.getString("id") %>,D">D</option>
									<option value="<%= rs.getString("id") %>,D">F</option>
								   <%
							}
							
							%>
								
					</select>
				</td>
			</tr>
		<%} %>
			</table>
			<input type="text" value="<%=subject_number%>" name="subject_number" hidden >
			<input type="submit" value="부여">
			</form>
			
			<%}
				else{
			%>
				<script>
					alert("수강한 학생이 없습니다.");
					location.href="after_login_professorMain.jsp";
				</script>
			<% }%>
		</div>

</body>
</html>