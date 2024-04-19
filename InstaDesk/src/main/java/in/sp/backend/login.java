package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.catalina.Session;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class login extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		String name = req.getParameter("email");
		String pass = req.getParameter("pass");
		HttpSession session = req.getSession();
		
			try {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
			
				Statement st = con.createStatement();
			
				ResultSet rs = st.executeQuery("SELECT * FROM logintb");
			
				while(rs.next()) {
				
					if(name.equals(rs.getString(4)) && pass.equals(rs.getString(5))) {
					
						session.setAttribute("log_name", rs.getString(2));
						session.setAttribute("first", rs.getInt(1));
						RequestDispatcher rd = req.getRequestDispatcher("/home.jsp");
						rd.forward(req, resp);
					
					}
				
				}
				
				resp.setContentType("text/html");
				out.print("<script>alert('Invalid Username / Password ')</script>");
				RequestDispatcher rd = req.getRequestDispatcher("/login.html");
				rd.include(req, resp);
				con.close();
			
			}catch(Exception e){
			
				e.printStackTrace();
				resp.setContentType("text/html");
				out.print("<h2>Error Occurred : "+e.getMessage()+"</h2>");
				RequestDispatcher rd = req.getRequestDispatcher("/login.html");
				rd.include(req, resp);
			
			}
			
		
	}
	
}
