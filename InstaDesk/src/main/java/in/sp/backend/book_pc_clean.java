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
import jakarta.servlet.http.HttpSession;

@WebServlet("/book_pc_clean")
public class book_pc_clean extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int id = (Integer)session.getAttribute("first");
		String date = req.getParameter("date");
		String time = req.getParameter("time");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
		
			PreparedStatement ps = con.prepareStatement("INSERT INTO service VALUES (null,'desktop clean','"+date+"','"+time+"',"+id+")");
			
			long result = ps.executeUpdate();
			
			if(result>0) {
				
				RequestDispatcher rd = req.getRequestDispatcher("/success3.jsp");
				rd.forward(req, resp);
				
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
	}
	
}
