<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
	<html> 
	    <head> 
	        <title>Level5</title>
	        <style type = "text/css">
html { background: #F8F991; 
       font-family: sans-serif;
       z-index: 2; }
.form {
    background-color: #F8F995;   
    z-index: 1;     
	margin: 0 auto;
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
.pa { 
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
#add img{
   position: absolute;
   float: left;
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
#minus img{
   position: absolute;
   float: left;
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
#close img{
    position: absolute;
	margin-top: 20px;
	margin-bottom: 5%;
	float: left;
	left: 55%;    
	z-index: 0;
    width: 100px;
	height: 100px;	
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
    left: 50%;
	margin-top: 0px;		
} 

          </style> 
	    </head> 
	    <body> 
	        <% 
	        String userid = (String)session.getAttribute("userName");
	        String name;
	        String address;
	        String title;
	        String level="5";
	        String user = "root"; 
		    String pass = "root"; 
		    String database = "shop"; 
		    String url = "jdbc:mysql://140.121.197.131:3306/test/" + database + "?useUnicode=true&characterEncoding=utf-8"; 	     
		    //建立一個聯結物件 
		        Connection conn; 
		    //建立Statement物件，建立陳述式物件 
		        Statement stmt=null; 
	        try{ 
		        //定義驅動程式與資料來源之間的連結 
		            Class.forName("org.mariadb.jdbc.Driver").newInstance(); 
		        //建立一個聯結物件 
		            conn = DriverManager.getConnection(url,user,pass); 
		        //建立Statement物件 
		            stmt = conn.createStatement(); 
		    }catch(SQLException sqle){ 
		        out.println("SQL Exception : " + sqle); 
		    } 
	            //建立查詢並產生rs的資料表 
	                String sql = "select * from shop where level='" + level + "'AND userid ='" + userid+"'"; 
	                ResultSet rs = stmt.executeQuery(sql); 
	            //開始顯示 
	            String id;
	          
	            out.print("<center><h1>✮✮✮✮✮評價✮✮✮✮✮</h1></center>"
	                    + " <div class = 'left' width= '150px' height= '250px'>"
	            		+ " <div id = '1'><img src = 'http://molening.github.io/watermelon/basePicture/1.png' width= '150px'; height = '150px';/></div>"
	    			    + " <div id = '2'><img src = 'http://molening.github.io/watermelon/basePicture/2.png' width= '150px'; height = '120px';/></div>"
	     			    + "<div id = '6'><img src = 'http://molening.github.io/watermelon/basePicture/6.gif' width= '160px'; height = '150px';/></div>"
	        			+ "</div>"	
	                    + "<div class = 'right' width= '150px' height= '250px'>"
	    			    + "<div id = '4'><img src = 'http://molening.github.io/watermelon/basePicture/4.gif' width= '150px'; height = '150px';/></div>"
	    			    + "<div id = '5'><img src = 'http://molening.github.io/watermelon/basePicture/5.png' width= '150px'; height = '130px';/></div>"
	        		    + "<div id = '3'><img src = 'http://molening.github.io/watermelon/basePicture/3.png' width= '180px'; height = '150px';/></div>"
	    			    + "</div>");
	            out.print("<div style='position: absolute; top:10%; right: 25%;'></br></br></br>");
                while(rs.next()){ 
	            	title = rs.getString("title"); 
                   level = rs.getString("level"); 
                   address = rs.getString("address"); 
                   id = rs.getString("id"); 
                   level="✮✮✮✮✮";
                   
                   out.print("<center><div style='width:580px;height:150px;background-color:lightblue;padding: 30px;'>");
                  
                   out.print("<a href='levelServlet?particle="+id+"' style='text-decoration:none;'>"
                        +"<div style='float: left; height: 120px; width: 120px; ' ><img src='getPicture?id="+id+ "' style=' height: 150px; width: 150px;'></div>"
                        + "<div style='float: right;  height: 150px; width: 400px; text-align:center;'><p style='font-size:30px;font-weight:weight;'>"   + level + "      " +title + "</p>" + address + "</div></a>" 
                        +"</div></center></br>");
	                 
	                }         
                out.print("</div>"); 
	
	            //關閉資料表 
	                rs.close(); 
	        %> 
	        
	        <br><br> 
	    </body> 
	</html> 