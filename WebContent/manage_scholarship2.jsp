<%@page import="se.Scholarship"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="se.Scholarship" %>
<title>Insert title here</title>
</head>
<%request.setCharacterEncoding("utf-8"); %>
<body>
		<% 
			
			int flag =0;
			Scholarship s = new Scholarship();
			String value[] = request.getParameterValues("kind");
	
			for(int i=0; i<value.length; i++){
				String values[] = value[i].split(",");
				String id = values[0];
				String kind = values[1];
				int result = s.give_scholarship(id , kind);
				if( result == 1){
					flag =1;
				}
			}
			
			if( flag == 1){
				%>
					<script>
					alert("장학여부 등록이 완료되었습니다.");
					location.href="after_login_managerMain.jsp";
					</script>
				<% 
			}else if( flag == 0){
				%>
					<script>
					alert("장학여부 등록에 실패하였습니다.");
					location.href="manage_scholarship.jsp";
					</script>
				<% 
			}
			
		
		%>
</body>
</html>