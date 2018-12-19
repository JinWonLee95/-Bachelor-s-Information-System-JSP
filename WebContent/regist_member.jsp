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
<%request.setCharacterEncoding("utf-8"); %>
</head>
<body>

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
				<form action="regist_member2.jsp" method="post">
					<table class="myinformation">
						<tr>
							<td>
								ID
							</td>
							<td>
								<input id="input_id" type="text" name="id" minlength="3" maxlength="9" required>
							</td>
						</tr>
						<tr>
							<td>
								비밀번호
							</td>
							<td>
								<input type="password" name="pwd" minlength="6" maxlength="10"required>
							</td>
						</tr>
					  <tr>
						<td>
								주소
							</td>
							<td>
								<input type="text" name="addr" required>
							</td>
						</tr>
						<tr>
						<td>
								전화번호
							</td>
							<td>
								<input type="text" name="phone" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="ex)010-1111-2222">
							</td>
						</tr>
						<tr>
						<td>
								현황(재학:1 / 휴학:0)
							</td>
							<td>
								<input type="number" name="current" max="1" min="0" required>
							</td>
						</tr>
						<tr>
						<td>
								권한(학생:1 / 교수:2)
							</td>
							<td>
								<input id="input_current" type="number" name="authority" max="2" min="1" required>
							</td>
						</tr>
					</table>
						<input type="submit" value="회원등록" onclick="check_length()">
				</form>
		</div>
</body>
</html>