package ntou.cs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // database connection settings
    private String dbURL = "jdbc:mysql://127.0.0.1:3306/wbse?useUnicode=true&characterEncoding=utf-8";
    private String dbUser = "root";
    private String dbPass = "";
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Statement stmt=null; 
        Connection conn = null; // connection to the database
        PrintWriter out = response.getWriter();
        
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        
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
            String sql = "INSERT INTO user (id, pwd) values (?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            
       
            
            statement.setString(1, id);
            statement.setString(2, password);
            
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
            	// forwards to the loginPage page
            	response.sendRedirect("loginPage.jsp");
                //out.println("Insert success!");
            }
        } catch (SQLException ex) {
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
            
        }
       
	}

}
