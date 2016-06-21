package ntou.cs;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Blob;

@WebServlet("/getPicture")
public class getPicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public getPicture() {
        super();
        // TODO Auto-generated constructor stub
    }
    // database URL
 	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    // database connection settings
    private String dbURL = "jdbc:mysql://127.0.0.1:3306/shops?useUnicode=true&characterEncoding=big5";
    private String dbUser = "root";
    private String dbPass = "";
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  
		request.setCharacterEncoding("UTF-8");
    	     
    	//建立一個聯結物件 
   	    Connection conn; 
   	    
   	    ResultSet resultSet = null;
     	
    	try{ 
    		// load JDBC driver (required for tomcat)
    		Class.forName(JDBC_DRIVER);
    		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            
            String id = request.getParameter("id");
            //System.out.println(name);
            String sql = "select * from shop where id='"+id+"'";
            System.out.println(sql);
            PreparedStatement statement = conn.prepareStatement(sql);
            
            resultSet = statement.executeQuery();
            
           // System.out.println("sss");
                       
            //開始顯示 
            if(resultSet.next()){ 
            	           
	           Blob b = (Blob) resultSet.getBlob("photo");
	           long size = b.length();
	           //out.print(size);
	           
				byte[] bs = b.getBytes(1, (int)size);
			
				response.setContentType("image/jpeg");
				OutputStream outs = response.getOutputStream(); 
			
				outs.write(bs);
				outs.flush();
				
				outs.close();
				//System.out.println("www");
								
     } 
          
        	//關閉資料表 
            resultSet.close();
            
        }catch (ClassNotFoundException classException)
		{
			classException.printStackTrace();
		} catch (SQLException sqlException)
		{
			sqlException.printStackTrace();
		}
    	
			}
}
