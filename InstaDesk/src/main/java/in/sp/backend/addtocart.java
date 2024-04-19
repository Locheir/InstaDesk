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

@WebServlet("/addtocart")
public class addtocart extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int item_id = Integer.parseInt(req.getParameter("item_id"));
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
		
			Statement st = con.createStatement();
		
			ResultSet rs = st.executeQuery("SELECT * FROM producttb where prod_id ="+item_id+"");
			
			while(rs.next()) {
				
				int prod_id = rs.getInt(1);
				String prod_name = rs.getString(2);
				String prod_img = rs.getString(3);
				String prod_cat = rs.getString(4);
				int prod_pri = rs.getInt(5);
				
				try {
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
					Statement st2 = con2.createStatement();
					
					ResultSet rs2 = st2.executeQuery("SELECT * FROM cart WHERE item_id = "+item_id+"");
					
					if(rs2.next()) {
						
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
						Statement st3 = con3.createStatement();
						
						ResultSet rs3 = st3.executeQuery("SELECT * FROM producttb WHERE prod_id="+item_id+"");
						
						int n = rs2.getInt(6);
						
						while(rs3.next()) {
						if(rs3.getInt(6)==n) {
							
							out.print("<script>alert('Max Quantity Available !! ')</script>");
							RequestDispatcher rd = req.getRequestDispatcher("/product.jsp");
							rd.include(req, resp);
							
						}else {
							
							n = n+1;
							PreparedStatement ps = con2.prepareStatement("UPDATE cart SET item_quantity="+n+" WHERE item_id ="+item_id+"");
							
							int result = ps.executeUpdate();
							
							if(result > 0) {
								
								session.setAttribute("prod_first", "yes");
								RequestDispatcher rd = req.getRequestDispatcher("/product.jsp");
								rd.forward(req, resp);
								
							}
							
						}
						}
						
						
						
						
					
					}else {
						PreparedStatement ps = con2.prepareStatement("INSERT INTO cart VALUES ("+prod_id+",'"+prod_name+"','"+prod_img+"','"+prod_cat+"',"+prod_pri+",1)");
						
						int result = ps.executeUpdate();
						
						if(result > 0) {
							
							session.setAttribute("prod_first", "yes");
							RequestDispatcher rd = req.getRequestDispatcher("/product.jsp");
							rd.forward(req, resp);
							
						}
						
						ps.close();
						con2.close();
					}
				}catch(Exception e) {
					
					e.printStackTrace();
					
				}
				
			}
			
			
			st.close();
			con.close();
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}
	
}
