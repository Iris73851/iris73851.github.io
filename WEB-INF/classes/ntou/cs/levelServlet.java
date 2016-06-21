package ntou.cs;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/levelServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class levelServlet extends HttpServlet{
		private static final long serialVersionUID = 1L;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public levelServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	   
	    
	    String name;
        String title;
        String address;
        String level;
        String comment;
        String id2;
        
	 // database connection settings
	    private String dbURL = "jdbc:mysql://140.121.197.131:3306/test/shop?useUnicode=true&characterEncoding=utf-8";
	    private String dbUser = "root";
	    private String dbPass = "root";
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
	    protected void doGet(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	        // gets values of text fields
	    	request.setCharacterEncoding("UTF-8");
	    	
	        String id = request.getParameter("particle");
	        
	        
	        Statement stmt=null; 
	        Connection conn = null; // connection to the database
	        String message = null;  // message will be sent back to client
	      
	        
	        try {
	            // connects to the database
	        	try { 
	        	    Class.forName("org.mariadb.jdbc.Driver"); 
	        	} 
	        	catch(ClassNotFoundException e) { 
	        	    System.out.println("can't find"); 
	        	} 
	            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
	            stmt = conn.createStatement(); 
	            // constructs SQL statement
	          
	            String sql = "SELECT * FROM shop WHERE id ="+ id ;
	            PreparedStatement statement = conn.prepareStatement(sql);
	            
	            ResultSet rs = stmt.executeQuery(sql); 
	                while(rs.next()){ 
	                	 title = rs.getString("title"); 
	                   name = rs.getString("name"); 
	                   address = rs.getString("address"); 
	                   level = rs.getString("level");
	                  comment = rs.getString("comment"); 
	                  String Com = "";
	     	         for(int i=0;i<comment.length();i++){
	     	        	 Com += comment.charAt(i);
	     	        	 if(comment.charAt(i)=='\n'){
	     	        		 Com += "</br>";
	     	        	 }
	     	         }
	     	         comment = Com;
	                  id2 = rs.getString("id"); 
	                 
	                }
	                
	            // sends the statement to the database server
	            
	           
	        } catch (SQLException ex) {
	            message = "ERROR: " + ex.getMessage();
	            ex.printStackTrace();
	        } finally {
	            if (conn != null) {
	                // closes the database connection
	                try {
	                    conn.close();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }
	            switch (level){
	            case "1":level="✮";break;
	            case "2":level="✮✮";break;
	            case "3":level="✮✮✮";break;
	            case "4":level="✮✮✮✮";break;
	            }
	            request.setAttribute("Title", title);
	            request.setAttribute("Name", name);
	            request.setAttribute("Address", address);
	            request.setAttribute("Level", level);
	            request.setAttribute("Photo",name);
	            request.setAttribute("Comment",comment);
	            request.setAttribute("id",id2);
	            
	           
	            // forwards to the message page
	            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
	           
	        }
	    }
}