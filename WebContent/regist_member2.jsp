
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@ page import ="se.Member" %>
 <%@ page import="java.net.URLEncoder" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%request.setCharacterEncoding("utf-8"); %>
<body>
	<% 
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String addr = request.getParameter("addr");
		String current = request.getParameter("current");
		String authority = request.getParameter("authority");
		String phone = request.getParameter("phone");
	
		Member m = new Member();
		if(!m.check(id)){
			boolean result =m.regist_member(id, pwd, addr,phone,Integer.parseInt(current), Integer.parseInt(authority));
			if( result == true){
				%>
				<script>
					alert("회원 등록 성공");
					location.href="after_login_managerMain.jsp";
				</script>
				<% 
			}else{
				%>
				<script>
				alert("회원 등록 실패");
				location.href="regist_member.jsp";
				</script>
				<%
			}
		}
		else{
			%>
			<script>
			alert("회원 등록된 아이디입니다.");
			location.href="regist_member.jsp";
			</script>
			<%
		}
		
		
	
	%>
</body>
</html>