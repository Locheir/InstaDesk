package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.net.ssl.HttpsURLConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/change_info")
public class change_info extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String address = req.getParameter("address");
		String state = req.getParameter("state");
		String country = req.getParameter("country");
		String l =  req.getParameter("contact");
		long contact = Long.parseLong(l);
		HttpSession session = req.getSession();
		int zip = Integer.parseInt(req.getParameter("zipcode"));
		
		int id = (Integer)session.getAttribute("first");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
		
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM custinfo WHERE cust_id="+id+"");
			
			if(rs.next()) {
				
				try {
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
				
					PreparedStatement ps = con2.prepareStatement("UPDATE custinfo SET custinfo_address='"+address+"' , custinfo_state='"+state+"' , custinfo_country='"+country+"' , custinfo_contact="+contact+" , custinfo_zip = "+zip+" WHERE cust_id="+id+"");
					
					int result = ps.executeUpdate();
					
					if(result > 0){
						
						RequestDispatcher rd = req.getRequestDispatcher("/account.jsp");
						rd.forward(req, resp);
						
					}
					
				}catch(Exception e) {
					
					e.printStackTrace();
					
				}
				
			}else {
				
				try {
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
				
					PreparedStatement ps = con2.prepareStatement("INSERT INTO custinfo VALUES(null,'"+address+"','"+state+"','"+country+"',"+contact+","+id+","+zip+")");
					
					int result = ps.executeUpdate();
					
					if(result > 0){
						
						RequestDispatcher rd = req.getRequestDispatcher("/account.jsp");
						rd.forward(req, resp);
						
					}
					
				}catch(Exception e) {
					
					e.printStackTrace();
					
				}

				
				
			}
		
		
		
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}
