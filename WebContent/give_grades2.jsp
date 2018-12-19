<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@page import="se.Grade" %>
<%@page import="se.Subject" %>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
	<%
		String  value[] = request.getParameterValues("grade");
		String subject_number = request.getParameter("subject_number");
		
		Grade g = new Grade();
		boolean result = g.give_grade(value ,subject_number);
	
		if(result == true){
			%>
				<script>
				alert("성적부여가 완료되었습니다.");
				location.href ="after_login_professorMain.jsp";
				</script>
			<% 		
			
		}else{%>
				<script>
				alert("성적부여에 실패하였습니다.");
				location.href ="give_grades.jsp";
				</script>
		<% 
		}
	
	%>
		
	
</body>
</html>