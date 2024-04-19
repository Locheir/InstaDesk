package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/change_general")
public class change_general extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		int id = (Integer) session.getAttribute("first");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
			
			PreparedStatement ps = con.prepareStatement("UPDATE logintb SET cust_fname='"+fname+"' , cust_lname='"+lname+"' , cust_email='"+email+"' WHERE cust_id="+id+"");
			
			int result = ps.executeUpdate();
			
			if(result>0) {
				
				RequestDispatcher rd = req.getRequestDispatcher("/account.jsp");
				rd.forward(req, resp);
				
			}
			
		}catch(Exception e){
			
			e.printStackTrace();
			
		}
		
	}
	
}
