<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.sql.ResultSet" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <%@ page import ="se.Member,com.mysql.jdbc.Connection" %>
<link rel="stylesheet" href="Main.css?ver=1">
   <link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="function.js"></script>
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
		<% 
			Member m = new Member();
			ResultSet rs = m.show_myinformation( (String)session.getAttribute("id"));
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
	<form action = "modify_information.jsp" method ="post">
		<table class="myinformation" >
			<tr>
				<th>
					아이디
				</th>
				<th>
					비밀번호
				</th>
				<th>
					주소
				</th>
				<th>
					전화번호
				</th>
				<th>
					휴/복여부
				</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="id" value= <%=rs.getString("id")%> disabled="true" >
				</td>
				<td>
					<input type="password" name="pwd" value= <%=rs.getString("password") %> minlength="6" maxlength="10">
				</td>
				<td>
					<input type="text" id="information_addr" name="addr" value="<%=rs.getString("address")%>" >
					
				</td>
				<td>
					<input type="text"  name="phone" value=<%=rs.getString("phone")%> pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="ex)010-1111-2222" >
				</td>
				<td>
					<%
					int current_value = rs.getInt("current") ;
					int autority_value = rs.getInt("authority");
					 if( autority_value ==1 && current_value == 1 ){  //학생 , 재학
						 %>
							<select name ="current">
								<option value="1">재학중</option>
								<option value="0">휴학</option>
							</select>
					 <%
					 }
					 else if(autority_value ==1  && current_value == 0  ){  //학생 휴학
						 %>
						 	<select name ="current">
								<option value="0">휴학중</option>
								<option value="1" >재학</option>
							</select>
						 <% 
					 }
					 else if(autority_value ==0 &&current_value == 1){ //교수 재직
						 %>
						 	<select name ="current">
								<option value="1">재직중</option>
								<option value="0">휴직</option>
							</select>
						 <% 
					 }
					 else if( autority_value ==0 && current_value == 0  ){ //교수 휴직
						 %>
						 	<select name ="current">
								<option value="0" >휴직중</option>
								<option value="1" >재직</option>
							</select>
						 <%
					 }
					 %>
				</td>
			</tr>
		</table>
		</br>
		<input type="submit" value="개인정보변경">
	</form>
	</div>
	
</body>
</html>