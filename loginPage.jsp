<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body background="HungryTaiwan.png">


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