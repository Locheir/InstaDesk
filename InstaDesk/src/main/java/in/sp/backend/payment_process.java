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

@WebServlet("/payment_process")
public class payment_process extends HttpServlet{
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int id = (Integer)session.getAttribute("first");
		String name_on_card = req.getParameter("name_on_card");
		long card_no = Long.parseLong(req.getParameter("card_num"));
		String card_exp = req.getParameter("expirey");
		int card_cvv = Integer.parseInt(req.getParameter("cvv"));
		double total_price = Double.parseDouble(req.getParameter("total_price").toString());
		int count = Integer.parseInt(req.getParameter("count"));
		PrintWriter out = resp.getWriter();
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
		
			PreparedStatement ps = con.prepareStatement("INSERT INTO payment VALUES (null,'"+name_on_card+"',"+card_no+",'"+card_exp+"',"+card_cvv+","+id+")");
			
			long result = ps.executeUpdate();
			
			if(result>0) {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
			
				PreparedStatement ps2 = con2.prepareStatement("INSERT INTO bill VALUES (null,"+total_price+","+count+","+id+")");
			
				long result2 = ps2.executeUpdate();
				
				if(result2>0) {
						
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
				
					Statement st3 = con3.createStatement();
				
					ResultSet rs3 = st3.executeQuery("SELECT * FROM cart");
					while(rs3.next()) {
						
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con7 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
						
						Statement st7 = con7.createStatement();
						
						ResultSet rs7 = st7.executeQuery("SELECT * FROM producttb WHERE prod_id = "+rs3.getInt(1)+"");
						
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
						
						PreparedStatement ps4 = con4.prepareStatement("INSERT INTO purch_prod VALUES("+rs3.getInt(1)+",'"+rs3.getString(2)+"',"+rs3.getInt(6)+","+rs3.getInt(5)+","+id+")");
						
						long result4 = ps4.executeUpdate();
						
						while(rs7.next()) {
							
							int curr = rs7.getInt(6);
							int minus = rs3.getInt(6);
							
							int new_qty = curr - minus;
							
							Connection con6 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
							
							PreparedStatement ps6 = con6.prepareStatement("UPDATE producttb SET prod_quantity = "+new_qty+" WHERE prod_id = "+rs3.getInt(1)+" ");
							
							long result6 = ps6.executeUpdate();
							
						
						}
								

								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
								
								PreparedStatement ps5 = con5.prepareStatement("TRUNCATE TABLE cart");
							
								long result5 = ps5.executeUpdate();
								
								
								if(result5>0) {
								
									resp.setContentType("text/html");
									out.print("<script>alert('Something Wrong')</script>");
									RequestDispatcher rd = req.getRequestDispatcher("/home.jsp");
									rd.include(req, resp);
								
								}else {
									
									Class.forName("com.mysql.cj.jdbc.Driver");
									
									/*resp.setContentType("text/html");
									out.print("<script>alert('Invalid Username / Password ')</script>");*/
									RequestDispatcher rd = req.getRequestDispatcher("/success.jsp");
									rd.forward(req, resp);
									
								}
							
						
					
						
						
					}
						
				}
				
			}
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}
