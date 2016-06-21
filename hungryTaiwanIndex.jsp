<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb='http://www.facebook.com/2008/fbml'>
 
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  
  <meta http-equiv="cache-control" content="no-cache" />
  <meta http-equiv="expires" content="3600" />
  <meta name="revisit-after" content="2 days" />
  <meta name="robots" content="index,follow" />
  <meta name="publisher" content="Your publisher infos here ..." />
  <meta name="copyright" content="Your copyright infos here ..." />
  <meta name="author" content="Design: Wolfgang (www.1-2-3-4.info) / Modified: Your Name" />
  <meta name="distribution" content="global" />
  <meta name="description" content="Your page description here ..." />
  <meta name="keywords" content="Your keywords, keywords, keywords, here ..." />
  <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/header2_setup.css" />
  <link rel="icon" type="image/x-icon" href="./img/bg_head_top_logo.png" />
  <!--下拉-->
    <link rel="stylesheet" href="css/lanrenzhijia3.css" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link href="css/lanrenzhijia.css" rel="stylesheet" type="text/css">
<script src="js/jquery.js"></script>
<script src="js/jquery-webox.js"></script>
  <!---->
  <title>食飢台灣</title>
  
</head>


<body>


<div style="display:none;"><embed src="Happy Ukulele Background Music for YouTube.mp3" autostart="true" hidden=true loop="1" volume="100"  /></div>
<!--下拉-->
  <script type="text/javascript">
    $(function(){
       $("#toggleLogin").toggle(function(){
        $("#login").parent("div").animate({ height : 105 } , 520 );
        $("#login").animate({marginTop : 0 } , 500 );
        $(this).blur();
       },function(){
        $("#login").parent("div").animate({ height : 0 } , 500 );
        $("#login").animate({marginTop : -105 } , 520 ); 
        $(this).blur();
       });
       $("#closeLogin").click(function(){
        $("#login").parent("div").animate({ height : 0 } , 500 );
        $("#login").animate({marginTop : -105 } , 520 ); 
       });
    })
	
	
	
	function handler(){
		console.log("AAALLDD");
			$.webox({
				height:650,
				width:1300,
				bgvisibel:true,
				title:'NEW',
				iframe:'index.html?'+Math.random
				});
			
	}
    </script>
    <!--下拉嵌入內容-->
    <div style="margin:0px;overflow:hidden;position:relative;height:0px;">
  <div id="login" style="margin:-105px 0px 0px;height:auto; ">
    <div class="loginContent">
	<div>
	<a href="https://www.facebook.com/ti254256"><img src="img/guan.JPG" width = "85px" height="85px" style="float:left"></a>
	<a href="https://www.facebook.com/bo.ning.507"><img src="img/mo.jpg" width = "85px" height="85px" style="float:left"></a>
	<a href="https://www.facebook.com/curryhung"><img src="img/kki.jpg" width = "85px" height="85px" style="float:left"></a>
	<a href="https://www.facebook.com/wenyu.cheng.90"><img src="img/yu.jpg" width = "85px" height="85px" style="float:left"></a>
	<a href="https://www.facebook.com/profile.php?id=100001638379926"><img src="img/oy.jpg" width = "85px" height="85px" style="float:left"></a>
	<a href="https://www.facebook.com/profile.php?id=100002492457304&fref=ts"><img src="img/iris.jpg" width = "85px" height="85px" style="float:left"></a>
	</div>
	<div class="left"></br>HungryTaiwan</div><img src="img/bg_head_top_logo.png" style="float:right;" width = "100px" height="100px" >
	
	
    <div class="right">
       <a href="logoutServlet"><h1>LOGOUT</h1></a>
	   <a href="javascript: handler();"><h2>README</h2></a>
	   
       <a href="javascript: void(window.open('http://www.facebook.com/share.php?u='.concat(encodeURIComponent(location.href)) ));"><h3>TO FB<h3></a>
       <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
    </div>
	
    </div>
    <div class="loginClose"><a href="#" id="closeLogin">close</a></div>
	
  </div>
</div>
<!---->
<div id="top">
  <ul class="login">
    <li class="left">&nbsp;</li>
    <li>您好,<%=session.getAttribute("userName")%> 
       </li>
    <li>|</li>
    <li><a id="toggleLogin" href="#">click!</a></li>
  </ul>
</div>
<!---->
 
   
    <div class="header" >
      
      <!-- A.1 HEADER TOP -->
      <div class="header-top">
        
        <!-- Sitelogo and sitename -->
        <a class="sitelogo" href="#" title="Go to Start page"></a>
        <div class="sitename">
          <h1><a href="hungryTaiwanIndex.jsp" title="Go to Start page">食飢台灣 Hungry Taiwan</a></h1>
          <h2>打開你的味蕾</h2>
        </div>
    
    	

       
      <div class="header-middle" align="right">    
   
       
        <div class="sitemessage" >
          <h1>FANTASY &bull; FOOD &bull; HUNGRY</h1>
          <h2>Let's enjoy the web.<br />Are you hungry<br /> Let's GO!!</h2>
        </div> 
	
	  </div>
   
     
 
   

     

    </div>
	<div>		
		<iframe src="webgl_geometry_minecraft.html" width="100%" height="85%" frameborder="0" scrolling="no"></iframe>
     </div>
  <!-- END COPY here -->

  </div> 
  
</body>
</html>




