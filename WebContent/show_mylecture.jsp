<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@page import="se.Subject" %>
 <%@page import="java.sql.ResultSet" %>  
 <link rel="stylesheet" href="Main.css?ver=1">
 <link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="function.js"></script>
</head>
<%request.setCharacterEncoding("utf-8"); %>
<body>
	<h2>성적부여 화면</h2>
	<% 
		Subject s = new Subject();
		String id = (String)session.getAttribute("id");
		ResultSet rs = s.show_mylecture(id);
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
		<table class="myinformation" >
				<tr>
					<th>
						선택
					</th>
					<th>
						과목번호
					</th>
					<th>
						과목명
					</th>
					<th>
						교수
					</th>
					<th>
						학년
					</th>
				</tr>
		<% 
		while(rs.next()){
	%>
			<tr>
				<td>
				<input type ="button" value ="학생_성적" onClick="location.href='give_grades.jsp?subject_num=<%=rs.getString("subject_number") %>'">
				</td>
				<td>
				<%=  rs.getString("subject_number")%>
				</td>
				<td>
				<%= rs.getString("subject_name")%>
				</td>
				<td>
				<%=  rs.getString("professor_name")%>
				</td>
				<td>
				<%= rs.getString("grade")%>
				</td>
				
			</tr>
		<%} %>
			</table>
			<%}
				else{
			%>
				<script>
					alert("등록된 강의가 없습니다.");
					location.href="after_login_professorMain.jsp";
				</script>
			<% }%>
		</div>
</body>
</html>