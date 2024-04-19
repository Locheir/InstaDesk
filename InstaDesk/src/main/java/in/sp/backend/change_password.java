package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/change_password")
public class change_password extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		int id = (Integer)session.getAttribute("first");
		
		String pass = req.getParameter("cpassword");
		String npass = req.getParameter("npassword");
		String rnpass = req.getParameter("rnpassword");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
			
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM logintb WHERE cust_id = "+id+"");
			while(rs.next()) {
			String dbpass = rs.getString(5);
			
			if(dbpass.equals(pass)) {
				
				if(npass.equals(rnpass)) {
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
					
					PreparedStatement ps = con.prepareStatement("UPDATE logintb SET cust_password='"+npass+"' WHERE cust_id="+id+"");
					
					int result = ps.executeUpdate();
					
					if(result > 0){
						
						RequestDispatcher rd = req.getRequestDispatcher("/account.jsp");
						rd.forward(req, resp);
						
					}
					
				}else {
					
					out.print("<script>alert('New Password and Confirm are not same ! ')</script>");
					RequestDispatcher rd = req.getRequestDispatcher("/account.jsp");
					rd.include(req, resp);
					con.close();
					
				}
				
			}else {
				
				out.print("<script>alert('Invalid Password ')</script>");
				RequestDispatcher rd = req.getRequestDispatcher("/account.jsp");
				rd.include(req, resp);
				con.close();
				
			}
			
			}			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}
