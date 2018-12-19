<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>교수 페이지</title>
<link rel="stylesheet" href="Main.css?ver=1">
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="function.js"></script>
</head>
<%request.setCharacterEncoding("utf-8"); %>
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
				<li class="active"><a href="after_login_professorMain.jsp">Home</a></li>
				<li><a href="regist_subject.jsp">강의등록</a></li>
				<li><a href="show_mylecture.jsp">성적부여</a></li>
				<li><a onclick="logout()" style="cursor:pointer">로그아웃</a></li>
			  </ul>
            </div>
         
        </div>
    </nav>
    <img src="./cnu.jpg" class="back back2">
    <div class = "show_box2">
		<h2>강의등록</h2>
		<form action="regist_subject2.jsp">
		<table class= "myinformation">
			<tr>
				<td>
					강의명 
				</td>
				 <td>
					 <input type="text" name="sub_name" required style="width:250px">
				 </td>
			<tr>
				<td>
					교수명 
				</td> 
				<td>
				<input type="text" name="pro_name" value=<%=session.getAttribute("id")%>  style="width:250px"> 
				</td>
			</tr>
			<tr>
				<td>
					학년 
				</td>
				 <td>
					<input type="number" name="grade" min=1 max=4 required style="width:250px"> 
				 </td>
			</tr>
			<tr>
				<td>
					인원 
				</td>
				 <td>
					<input type="number" name="personnel" max=60 required style="width:250px">
				 </td>
			</tr>
			<tr>
				<td>
					시간 
				</td>
				 <td>
					 <input type="text" name="time" required style="width:250px" pattern="[0-9]{2}:[0-9]{2}~[0-9]{2}:[0-9]{2}" title="ex)11:00~13:00">
				 </td>
			</tr>
			<tr>
				<td>
					요일 
				</td>
				 <td>
					<select name ="day" style="width:250px">
								<option>월요일</option>
								<option>화요일</option>
								<option>수요일</option>
								<option>목요일</option>
								<option>금요일</option>
					</select>
				 </td>
			</tr>
			<tr>
				<td>
					장소 
				</td>
				 <td>
					<select name ="place" style="width:250px">
								<option>공대5호관 401호</option>
								<option>공대5호관 402호</option>
								<option>공대5호관 403호</option>
								<option>공대5호관 404호</option>
								<option>공대5호관 405호</option>
								<option>공대5호관 406호</option>
								<option>공대5호관 407호</option>
								<option>공대5호관 408호</option>
								<option>공대5호관 409호</option>
								<option>공대5호관 410호</option>
					</select>
				 </td>
			</tr>
			</table>
			<input type="submit" value="강의등록" > 
		</form>
		
	</div>
	
	
	
</body>
</html>