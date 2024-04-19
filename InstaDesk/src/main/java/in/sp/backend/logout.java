package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class logout extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 // Invalidate the session. 
        req.getSession(false).invalidate();
        
        try {
        Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
		
		PreparedStatement ps5 = con5.prepareStatement("TRUNCATE TABLE cart");
	
		long result5 = ps5.executeUpdate();
		
		RequestDispatcher rd = req.getRequestDispatcher("/home.jsp");
		rd.forward(req, resp);
		
        }catch(Exception e) {
        	
        	e.printStackTrace();
        	
        }
        
        
		
	}
	
}
