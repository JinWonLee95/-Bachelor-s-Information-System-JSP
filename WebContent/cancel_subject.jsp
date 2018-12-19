<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@page import="se.Subject" %>
<%request.setCharacterEncoding("utf-8"); %>
</head>
<body>
		<%
	
		String id= (String)session.getAttribute("id");
		String sub_number = request.getParameter("subject_num");
		
		Subject s = new Subject();
		boolean result = s.cancel_subject(id, sub_number);
		if( result == true){
			%>
				<script>	
					alert("수강취소 되었습니다.");
					location.href="view_timetable.jsp";
				</script>
			<% 
		}
		else{
			%>
			<script>	
					alert("수강취소가 실패되었습니다.");
					location.href="view_timetable.jsp";
				</script>
			<% 
		}
	%>
</body>
</html>