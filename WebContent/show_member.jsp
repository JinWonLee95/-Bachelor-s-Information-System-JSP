<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Main.css?ver=1">
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="function.js"></script>
<%@page import="se.Member" %>
    <%@page import="java.sql.ResultSet" %>  
</head>
<%request.setCharacterEncoding("utf-8"); %>
<body>
<% 
			Member m = new Member();
			ResultSet rs = m.show_member();
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
				<li class="active"><a href="after_login_managerMain.jsp">Home</a></li>
				<li><a href="show_member.jsp">회원조회</a></li>
				<li><a href="regist_member.jsp">회원등록</a></li>
				<li><a href="manage_scholarship.jsp">장학관리</a></li>
				<li><a onclick="logout()" style="cursor:pointer">로그아웃</a></li>
			  </ul>
            </div>
         
        </div>
    </nav>
			<img src="./cnu.jpg" class="back back2">
	<div class="show_box">
		<h2>회원 전체 조회</h2>
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
				<th>
					권한
				</th>
			</tr>
			<%
				while(rs.next()){
					if(!rs.getString("id").equals("admin")){
			%>
			<tr>
				<td>
					<%=rs.getString("id")%> 
				</td>
				<td>
					 <%=rs.getString("password")%> 
				</td>
				<td>
					<%=rs.getString("address")%> 
				</td>
				<td>
					<%=rs.getString("phone")%> 
				</td>
				<td>
					<%
					int current_value = rs.getInt("current") ;
					int autority_value = rs.getInt("authority");
					 if( autority_value ==1 && current_value == 1 ){  //학생 , 재학
						 %>
							재학중
					 <%
					 }
					 else if(autority_value ==1  && current_value == 0  ){  //학생 휴학
						 %>
						 	휴학중
						 <% 
					 }
					 else if(autority_value ==2 &&current_value == 1){ //교수 재직
						 %>
						 	재직중
						 <% 
					 }
					 else if( autority_value ==2 && current_value == 0  ){ //교수 휴직
						 %>
						 	휴직중
						 <%
					 }
					 
					 %>
				</td>
				<td>
					<%  if(autority_value == 1 ){
							%> 학생
						<% }
						else if( autority_value == 2 ){
							%>
							교수
			<%
						}
						%>
					
					
				</td>
			</tr>
			
		<%	}
		}
			%>
		</table>
		</div>
</body>
</html>