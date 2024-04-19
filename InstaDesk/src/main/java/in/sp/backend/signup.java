package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class signup extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		PrintWriter out = resp.getWriter();
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO logintb VALUES(?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, fname);
			ps.setString(3, lname);
			ps.setString(4, email);
			ps.setString(5, pass);
			
			int count = ps.executeUpdate();
			
			if(count>0) {
				
				resp.setContentType("text/html");
				
				RequestDispatcher rd = req.getRequestDispatcher("/login.html");
				rd.forward(req, resp);
				
			}else {
				resp.setContentType("text/html");
				out.print("<h2>SignUp Unsuccesfull ...</h2>");
				RequestDispatcher rd = req.getRequestDispatcher("/signup.html");
				rd.include(req, resp);
				
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
			resp.setContentType("text/html");
			out.print("<h2>Error Occurred : "+e.getMessage()+"</h2>");
			RequestDispatcher rd = req.getRequestDispatcher("/signup.html");
			rd.include(req, resp);
			
			
		}
		
	}
	
}
