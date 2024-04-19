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

@WebServlet("/contact")
public class contact extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		long contact = Long.parseLong(req.getParameter("phone"));
		String msg = req.getParameter("msg");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO contact VALUES(null,'"+fname+"','"+lname+"','"+email+"',"+contact+",'"+msg+"')");
			
			int result = ps.executeUpdate();
			
			if(result>0) {
				
				resp.setContentType("text/html");
				
				RequestDispatcher rd = req.getRequestDispatcher("/success2.jsp");
				rd.forward(req, resp);
				
			}
			
			ps.close();
			con.close();
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		
	}
	
}
