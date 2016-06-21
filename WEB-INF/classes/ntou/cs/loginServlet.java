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
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    // database URL
  	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    
  	// database connection settings
    private String dbURL = "jdbc:mysql://127.0.0.1:3306/wbse?useUnicode=true&characterEncoding=utf-8";
    private String dbUser = "root";
    private String dbPass = "";
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String user = request.getParameter("id");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        
		
        Connection conn = null; // connection to the database
        ResultSet rs = null;
        
        try {
        	// load JDBC driver (required for tomcat)
    		Class.forName(JDBC_DRIVER);
    		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            
            // constructs SQL statement
            String sql = "SELECT * from user";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            rs = statement.executeQuery();
            int correct = 0;
            
            while(rs.next()){ 
	            
	            if(user.equals(rs.getString("id")) && password.equals(rs.getString("pwd"))){
	            	correct = 1;
	            	break;
	            }
            }
            
            if(correct == 1){
            	out.println("Hello~"+user);
            	out.println("<script type='text/javascript'>localStorage.setItem('userName',"+user+");</script>");
            	session.setAttribute("userName", user);
            	getServletContext().getRequestDispatcher("/hungryTaiwanIndex.jsp").forward(request, response);
            	
            }else{
            	out.println("<script type='text/javascript'>alert('You Got Wrong password!');</script>");
            	response.sendRedirect("loginPage.jsp");
            }
            
        } catch (SQLException ex) {
            
            ex.printStackTrace();
        } catch (ClassNotFoundException classException)
		{
			classException.printStackTrace();
		}finally {
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
