<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@page import="se.Member" %>
 <%@page import="java.sql.ResultSet" %>  
</head>
<%request.setCharacterEncoding("utf-8"); %>
<body>
		<% 
			String id = request.getParameter("id");
			Member m = new Member();
			boolean result = m.delete_member(id);
			
			if( result == true){
				%>
					<script>
						alert("삭제 성공");
						location.href= "after_login_managerMain.jsp";
					</script>
				<% 
			}
			else{
				%>
				<script>
				alert("삭제 실패");
				location.href= "show_member.jsp";
			</script>
				</script>
				<%
			}
		%>
		
</body>
</html>