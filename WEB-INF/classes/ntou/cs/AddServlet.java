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


@WebServlet("/AddServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class AddServlet extends HttpServlet{
		private static final long serialVersionUID = 1L;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public AddServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	    
	    // database connection settings
	    private String dbURL = "jdbc:mysql://140.121.197.131:3306/test/shop?useUnicode=true&characterEncoding=utf-8";
	    private String dbUser = "root";
	    private String dbPass = "root";
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
	    protected void doPost(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	        // gets values of text fields
	    	request.setCharacterEncoding("UTF-8");
	    	 HttpSession session = request.getSession();
	    	 
	    	 String Title = request.getParameter("Title");
	         String Name = request.getParameter("Name");
	         String Address = request.getParameter("Address");
	         String Level = request.getParameter("Level");
	         String Comment = request.getParameter("Comment");
	         String Com = "";
	         for(int i=0;i<Comment.length();i++){
	        	 Com += Comment.charAt(i);
	        	 if(Comment.charAt(i)=='\n'){
	        		 Com += "</br>";
	        	 }
	         }
	         Comment = Com;
	         String userid =(String) session.getAttribute("userName");
	         int id = 0;
	         
	         double lat = Double.parseDouble(request.getParameter("lat"));
	         double lng = Double.parseDouble(request.getParameter("lng"));
	        InputStream inputStream = null; // input stream of the upload file
	         
	        // obtains the upload file part in this multipart request
	        Part filePart = request.getPart("Photo");
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
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
	            String sql = "INSERT INTO shop (title, name, address, level, comment, photo, userid, lat, lng) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            
	            statement.setString(1, Title);
	            statement.setString(2, Name);
	            statement.setString(3, Address);
	            statement.setString(4, Level);
	            statement.setString(5, Comment);
	            if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
	                statement.setBlob(6, inputStream);
	            }
	            statement.setString(7, userid);
	            statement.setDouble(8, lat);
	            statement.setDouble(9, lng);
	            
	           
	            
	            
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) {
	                message = "新增成功!";
	            }
	            
	            String s = "select * from shop where title='"+Title+"'";
	            System.out.println(s);
	            PreparedStatement state = conn.prepareStatement(s);
	            ResultSet rs = state.executeQuery();
	            
	            if(rs.next()){
	            	id = rs.getInt("id");
	            	System.out.println(id);
	            }
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
	 
	            switch (Level){
	            case "1":Level="✮";break;
	            case "2":Level="✮✮";break;
	            case "3":Level="✮✮✮";break;
	            case "4":Level="✮✮✮✮";break;
	            case "5":Level="✮✮✮✮✮";break;
	            }
	            request.setAttribute("Title", Title);
	            request.setAttribute("Name", Name);
	            request.setAttribute("Address", Address);
	            request.setAttribute("Level", Level);
	            request.setAttribute("Photo",inputStream);
	            request.setAttribute("Comment",Comment);
	            request.setAttribute("id",id);
	            System.out.print(message);
	            
	            // forwards to the message page
	            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
	        }
	    }
}