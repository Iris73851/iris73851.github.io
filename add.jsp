<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>
 <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBUhHtJqjzKdYW3IJppOf6g31VJeqD0nnU">
    </script>
    <script type="text/javascript" src="markerclusterer.js"></script>
<script type="text/javascript" src="addMap.js"></script>
<style type = "text/css">
html { background: #F8F991; 
       font-family: sans-serif;
       z-index: 2; }
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
#board{
    color: #18314F;
    background-color:white;
    float: left;	
    width:600px;
    height:200px;
    border:3px #cccccc dashed;
}
#add {
    cursor: pointer;
}
#add a img{
   position: absolute;
   margin-top: 20px;
   margin-bottom: 5%;
   left: 45%;   
   z-index: 0;
   width: 55px;
   height: 55px;   
}
#minus {
    cursor: pointer;
}
#minus a img{
   position: absolute;
   margin-top: 20px;
   margin-bottom: 5%;
   left: 50%;   
   z-index: 0;
   width: 50px;
   height: 50px;  
}
#close {
    cursor: pointer;
}                
#close a img{
    position: absolute;
	margin-top: 20px;
	margin-bottom: 5%;
	left: 55%;    
	z-index: 0;
    width: 100px;
	height: 100px;	
}

.right{
    position: relative;
    float: right;	
	margin-bottom: 0px;
	margin-top: 0px;		
} 

</style>
</head> 
<body>
<div id="map-canvas"></div>
<h1>新增食記</h1><br>
<form method="post" action="AddServlet" enctype="multipart/form-data">

<div class = "form">

<p>標題: <input type="text" name="Title" size="60"></p>
<p>店家名稱: <input type="text" name="Name"></p>
<p>地址: <input id="autocomplete" placeholder="Enter a loction" type="text" name="Address" />
<input type="hidden" id="lat" name="lat" value="2"/>
<input type="hidden" id="lng" name="lng" value="2"/>
<p>評價: <select name="Level">
			  <option value="1">✮</option>
			  <option value="2">✮✮</option>
			  <option value="3">✮✮✮</option>
			    <option value="4">✮✮✮✮</option>
			  <option value="5">✮✮✮✮✮</option></select>
</p>
<p>照片: <input type="file" name="Photo" size="30"/></p>
<p>評語:</p>
 <TextArea Cols="60" Rows="20" Name="Comment" Wrap="Off"></TextArea>
 
</div>
    <div class = "right" width= "150px"; height= "250px">
      <input type="image" src = "http://molening.github.io/watermelon/basePicture/adddd.png" width= "200px" height = "200px" onclick="submit()"/> 
    </div>
    
</form>

</body>