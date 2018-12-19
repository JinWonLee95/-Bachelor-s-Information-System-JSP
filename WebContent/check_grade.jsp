<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@page import="se.Grade" %>
  <%@page import="java.sql.ResultSet" %>  
 <link rel="stylesheet" href="Main.css?ver=1">
   <link href="bootstrap.min.css" rel="stylesheet" type="text/css">
   <script src="function.js"></script>

</head>

<body>
	<% 
		Grade g = new Grade();
		String id = (String)session.getAttribute("id");
		ResultSet rs = g.check_grade(id);
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
				<li class="active"><a href="after_login_studentMain.jsp">Home</a></li>
				<li><a href="show_myinformation.jsp?id=<%=session.getAttribute("id") %>">개인정보조회</a></li>
				<li><a href="show_allsubject.jsp">수강편람조회</a></li>
				<li><a href="apply_subject.jsp">수강신청</a></li>
				<li><a href="view_timetable.jsp">시간표확인</a></li>
				<li><a href="check_grade.jsp">성적조회</a></li>
				<li><a href="check_graduate.jsp">졸업자가진단</a></li>
				<li><a href="check_scholarship.jsp">장학여부확인</a></li>
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
						과목번호
					</th>
					<th>
						과목명
					</th>
					<th>
						학년
					</th>
					<th>
						성적
					</th>
					<th>
						평점
					</th>
				</tr>
		<% 
		while(rs.next()){
	%>
			<tr>
				<td>
				<%=  rs.getString("subject_number")%>
				</td>
				<td>
				<%= rs.getString("subject_name")%>
				</td>
				<td>
				<%= rs.getString("s.grade")%>
				</td>
				<td>
				<%= rs.getString("a.grade")%>
				</td>
				<td>
				<%
				if( rs.getString("a.grade").equals("F") || rs.getString("a.score").equals("0")){
					%>
						
					<% 
				}else{%>
					<%=rs.getString("a.score")%>
				<% 
				}
					%>
				</td>
				
			</tr>
		<%} %>
			</table>
			<%}
				else{
			%>
				<script>
					alert("신청한 강의가 없습니다.");
					location.href="after_login_studentMain.jsp";
				</script>
			<% }
			%>
	
</body>
</html>