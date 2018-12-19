<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="se.Login,com.mysql.jdbc.Connection" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<%
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		Login l = new Login();
		
		if(l.check(id,pwd)){
			session.setAttribute("id",id);
			%>
			<script>
			alert("로그인 성공");
			</script>
			<%
			int authority=l.getAuthority();
			session.setAttribute("current", l.getCurrent());
			
			if( authority ==0 ){
				
			%>
				<script>
				location.href ="after_login_managerMain.jsp?<%=id%>" ; //관리자 메인
				</script>
			<%}
			else if( authority == 1){
				
			%>
				<script>
				
				location.href ="after_login_studentMain.jsp"; //학생메인
				</script>
			<% }
			else if( authority == 2){
				
			%>
				<script>
				
				location.href ="after_login_professorMain.jsp"; //교수 메인
				</script>
			<% }
			%>
			
			<% 
			
		}
		else{
			int fail_reason = l.getFail_reason();
			if(fail_reason ==1 ){
				%>
				<script>
				alert("비밀번호가 틀렸습니다");
				location.href ="Main.jsp";
				</script>
				<% 
			}
			else if( fail_reason == 2){
				%>
				<script>
				alert("잘못된 아이디입니다.");
				location.href ="Main.jsp";
				</script>
				<% 
			}
		}
		%>
	
	
	

</body>
</html>