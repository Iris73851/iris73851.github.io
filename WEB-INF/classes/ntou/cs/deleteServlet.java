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
import javax.servlet.http.Part;


@WebServlet("/deleteServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class deleteServlet extends HttpServlet{
		private static final long serialVersionUID = 1L;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public deleteServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	 // database connection settings
	    private String dbURL = "jdbc:mysql://127.0.0.1:3306/shops?useUnicode=true&characterEncoding=utf-8";
	    private String dbUser = "root";
	    private String dbPass = "";
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
	        	    Class.forName("com.mysql.jdbc.Driver"); 
	        	} 
	        	catch(ClassNotFoundException e) { 
	        	    System.out.println("can't find"); 
	        	} 
	            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
	            stmt = conn.createStatement(); 
	            // constructs SQL statement
	            String sql = "DELETE FROM shop WHERE id = " + id;
	            
	           
	            PreparedStatement statement = conn.prepareStatement(sql);
	          
	 
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) {
	                message = "刪除成功!";
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
	            getServletContext().getRequestDispatcher("/look.jsp").forward(request, response);
	        }
	    }
}