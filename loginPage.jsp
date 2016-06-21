<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body background="HungryTaiwan.png">
<link href="alertify.core.css" rel="stylesheet">  
		<link href="alertify.default.css" rel="stylesheet" id = "toggleCSS"> 
		<script src = "jquery-1.9.1.js"></script>
		<script src="alertify.min.js"></script> 
<script>
	function start(){
		var error = <%=getServletContext().getAttribute("error")%>;
		if(error == "1"){
			alertify.error("你輸入錯誤的密碼或帳號，請重試！");
		}else if(error =="2"){
			alertify.success("您已成功登出！");
		}
	}
	window.addEventListener( "load", start, false );
	   
</script>

<div align="center">
<div style="
background-image:url('indexImg.png');
padding:5px;width:677px;height:686px;
border:0px;background-repeat:no-repeat;">

<br><br><br><br><br><br><br><br><br><br><br><br>
<img src="Login.png"></img>
<br><br>
<form action="loginServlet" method="post" name="form1">
<img src="Username.png"></img>
<input name="id" type="text" id="id"> 
<br><br>
<img src="Password.png"></img>
<input name="password" type="password" id="password">
<br>
<br>
<input name="submit" type="image" src="Submit.png">  <a href="register.jsp"><img src="SignUp.png"></img></a></form>

</div>
</div>
</body>
</html>