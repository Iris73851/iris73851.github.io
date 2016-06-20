<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Message</title>
<style type = "text/css">
html { background: #F8F991; 
       font-family: sans-serif;
       z-index: 2;
        }

        }
.form {
    
    background-color: #F8F995; 
    z-index: 1;     
	padding-left: 35%;
    width: 50%;
	left: 25%;
}  
h1{ background-color: #4281A4;
     float: left;
	 width: 100%;
	 height: 80px;
	 color: white;
     font-size: 50px;
	 margin-top: 0px;
	 margin-left: 0px;
	 margin-right: 0px;
     text-align: center;	 
}
p { 
    color: #114B5F;
    font-size: 20px;
    margin-top: 5px;
	margin-bottom: 10px;
	text-align: left;
}

#b{
  position: absolute;
}
#add {
    cursor: pointer;
}
#add input{
float:right;  
  top: 70%; 
  float:left;
}
#minus {
    cursor: pointer;
}
#minus input{
 float:right; 
   top: 70%; 
    float:left;
}
#close {
    cursor: pointer;
}                
#close input{
 position: absolute;
    right: 3%;
    top: 3%;
}
.left{
    position: relative;
    float: left;
	margin-left: 30px;
	margin-top: 0px;
}

.right{
    position: relative;
    float: right;	
    margin-right: 30px;
	margin-top: 0px;		
} 

</style>


</head>
<body>
        <h1><%=request.getAttribute("Title")%></h1>
        <div class = "left" width= "150px"; height= "250px">
    		<div id = "1">
			    <img src = "http://molening.github.io/watermelon/basePicture/1.png" width= "150px"; height = "150px";/>
			</div>
			<div id = "2">
    				<img src = "http://molening.github.io/watermelon/basePicture/2.png" width= "150px"; height = "120px";/>
            </div>
			
            <div id = "6">
    				<img src = "http://molening.github.io/watermelon/basePicture/6.gif" width= "160px"; height = "150px";/>
            </div>				
        </div>
		<div class = "right" width= "150px"; height= "250px">
    		<div id = "4">
			    <img src = "http://molening.github.io/watermelon/basePicture/4.gif" width= "150px"; height = "150px";/>
			</div>
			<div id = "5">
    				<img src = "http://molening.github.io/watermelon/basePicture/5.png" width= "150px"; height = "130px";/>
            </div>
			<div id = "3">
    				<img src = "http://molening.github.io/watermelon/basePicture/3.png" width= "180px"; height = "150px";/>
            </div>			
        </div>
        <div class = "form">
       
        <p>店家:<%=request.getAttribute("Name")%></p>
        
        <p>評價:<%=request.getAttribute("Level")%></p>
        <p>地址:<%=request.getAttribute("Address")%></p>
        <div id="map-canvas"></div>
        
        <p style="text-align:center;"><img src="getPicture?id=<%=request.getAttribute("id")%>" style="height:500px; width: 500px;"></p>
       
        <p style="text-align:center;">評語</p>
         <center>
        <div style="overflow:scroll; color:#18314F;background-color:white;width:500px;height:300px; border:3px #cccccc dashed;"><%=request.getAttribute("Comment")%></div>
        </center></div>
     
       <div id="minus">
         <%  String id = (String)request.getAttribute("id");
             out.print("<form method='post' action ='deleteServlet'>"
	                    + "<div>"
	                    +"<a href='deleteServlet?particle="+id+"' style='text-decoration:none;'>"
                        +"<img src='http://molening.github.io/watermelon/basePicture/delete.png' width='60px' height='60px'/></a>"
	                    + "</div>"
                        + "</form>");
         %>
         </div>
     
           <div id= "add">
            <input type ="image" src = "http://molening.github.io/watermelon/basePicture/add.png" width= "60px" height = "60px" onclick="window.location.href ='add.jsp'"/>
           </div>
       
            <div id = 'close'>
                <input type = "image" src = "look.png" width= "60px" height = "60px" onclick="window.location.href ='look.jsp'">
            </div>
           
           
    </body>
</html>