function logout(){
	alert("로그아웃되었습니다.");
	location.href="Main.jsp";
}

function input(){
	var id = document.getElementsByClassName("id");
	var pwd = document.getElementsByClassName("pwd");
	var addr = document.getElementsByClassName("information_addr");
	var phone = document.getElementsByClassName("phone");
	var current = document.getElementsByClassName("current");
	
	
}

function check_length(){
	var id = document.getElementsByid("input_id");
	var current = document.getElementsByid("input_current");
	
	if(current == 1){
		if(id.length() !=9 ){
			alert("학생 아이디(학번)는 9자리여야합니다.");
		}
	}else{
		if(id.length() != 3){
			alert("교수 아이디(이름)은 3자리여야합니다.");
		}
	}
	
}