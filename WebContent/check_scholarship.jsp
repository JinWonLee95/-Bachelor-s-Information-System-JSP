<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@page import="se.Scholarship" %>
 <%@page import="java.sql.ResultSet" %>  
</head>
<%request.setCharacterEncoding("utf-8"); %>
<body>
	<% 
		Scholarship s = new Scholarship();
		String id = (String)session.getAttribute("id");
		String rs = s.check_scholarship(id);
		
		if(!rs.equals("")){
			
			if(rs.equals("전액장학금")){
			%>
				<script>
					alert("전액장학금입니다.");
				</script>
			<% 
				}
				else if(rs.equals("부분장학금")){
						%>
						<script>
							alert("부분장학금입니다.");
						</script>
						<% 
					}
				else{
					%>
					<script>
					alert("장학금이 없습니다.");
					</script>
					<% 	
				}
		}
		else{
			%>
				<script>
					alert("아직 등록되어있지 않습니다.");
				</script>
				
			<% 
		}
		%>
			
			<script>
			location.href="after_login_studentMain.jsp";
			</script>
				
	
	

</body>
</html>