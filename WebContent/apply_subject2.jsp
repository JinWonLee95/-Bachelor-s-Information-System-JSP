<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<%@page import="se.Subject" %>
</head>
<body>
	<%
		String id= (String)session.getAttribute("id");
		String sub_number = request.getParameter("subject_number");
		String sub_name = request.getParameter("subject_name");
		
		Subject s = new Subject();
	if((int)session.getAttribute("current") == 1 ){
		boolean result = s.course_subject(id, sub_number , sub_name);
		if( result == true){
			%>
				<script>	
					alert("수강신청되었습니다.");
					location.href="apply_subject.jsp";
				</script>
			<% 
		}
		else{
			int fresult = s.getApply_result();
			if( fresult == 0){
			%>
			<script>	
					alert("이미 신청한 강의입니다.");
					location.href="apply_subject.jsp";
				</script>
			<% 
			}
			else{
				%>
				<script>	
						alert("신청인원이 초과하였습니다.");
						location.href="apply_subject.jsp";
					</script>
				<% 
			}
		 }
		}
		else{
			%>
				<script>
					alert("휴학 상태입니다.");
					location.href="after_login_studentMain.jsp";
				</script>
			<% 
		}
	%>
	
	
</body>
</html>