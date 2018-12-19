<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%@ page import ="se.Member" %>
 <%request.setCharacterEncoding("utf-8"); %>
<title>Insert title here</title>
</head>
<body>
	<%
		Member m = new Member();
	
		String id = (String)session.getAttribute("id");
		String pwd = request.getParameter("pwd");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String curr = request.getParameter("current");
		session.setAttribute("current", Integer.parseInt(curr));
		int result = m.modify_information(id, pwd, addr,phone, curr);
		if(result == 0){
			%>
				<script>
				alert("수정 실패");
				location.href ="show_myinformation.jsp";
				</script>
			<%
			
		}
		else{
			%>
				<script>
				alert("수정 성공");
				location.href ="after_login_studentMain.jsp";
				</script>
			
			<% 
			
		}
		
	%>
	
</body>
</html>