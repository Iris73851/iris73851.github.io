<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="alertify.core.css" rel="stylesheet">  
		<link href="alertify.default.css" rel="stylesheet" id = "toggleCSS"> 
		
		<script src="alertify.min.js"></script> 
<meta charset="BIG5">
<title>SignIn</title>
<script type="text/javascript">
	function check(){
		
	<%
    	String user = "root"; 
    	String pass = "root"; 
    	String database = "user"; 
   	    String url = "jdbc:mysql://140.121.197.131:3306/test/" + database + "?useUnicode=true&characterEncoding=big5"; 
    	     
    	//建立一個聯結物件 
   	    Connection conn; 
     	//建立Statement物件，建立陳述式物件 
    	Statement stmt; 
     	
    	try{ 
   	        //定義驅動程式與資料來源之間的連結 
            Class.forName("org.mariadb.jdbc.Driver").newInstance(); 
            //建立一個聯結物件 
            conn = DriverManager.getConnection(url,user,pass); 
            //建立Statement物件 
            stmt = conn.createStatement(); 
            
          	//建立查詢並產生rs的資料表 
            String sql = "select * from user"; 
            ResultSet rs = stmt.executeQuery(sql); 
                        
            //開始顯示 
            while(rs.next()){ 
               String id = rs.getString("id");
              %>
              console.log("<%=id%>");
              var name = "<%=id%>";
              
              	if(name == document.getElementById("id").value){
              		alertify.error("你的帳號已有其他人使用！");
              		document.getElementById("id").value = "";
              		
              	}
              <%
             
            } 
        	//關閉資料表 
        	rs.close();
            
        }catch(SQLException sqle){ 
   	        out.println("SQL Exception : " + sqle); 
        } 
    	
    	
    	%>
	}
	function start(){
		document.getElementById("id").addEventListener("change", check, false);
	}
	window.addEventListener( "load", start, false );
	
</script>
</head>
<body background="HungryTaiwan-1.png">

<div align="center">
<div style="
background-image:url('registerImg.png');
padding:5px;width:677px;height:686px;
border:0px;background-repeat:no-repeat;">

<br><br><br><br><br><br><br><br><br><br><br><br>
<img src="Register.png"></img>
<form action="registerServlet" method="post" name="form1">
<img src="Username-1.png"></img>
<input name="id" type="text" id="id" onchange="check"> 
<br><br>
<img src="Password-1.png"></img>
<input name="password" type="password" id="password">
<br>
<br>
<input name="submit" type="image" src="Submit-1.png"></form>

</div>
</div>

</body>
</html>