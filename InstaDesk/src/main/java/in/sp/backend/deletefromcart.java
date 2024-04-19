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

@WebServlet("/deletefromcart")
public class deletefromcart extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int item_id = Integer.parseInt(req.getParameter("item_id"));
		HttpSession session = req.getSession();
				
			try{
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
				Statement st2 = con2.createStatement();
				
				ResultSet rs2 = st2.executeQuery("SELECT * FROM cart WHERE item_id = "+item_id+"");
				
					if(rs2.next()) {
						
						int n = rs2.getInt(6);
						if(n>1) {
						try {
						
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
							
							PreparedStatement ps = con.prepareStatement("UPDATE cart SET item_quantity="+(n-1)+" WHERE item_id = "+item_id+"");
							
							int result = ps.executeUpdate();
							
							ps.close();
							con.close();
							
							if(result > 0) {
						
								session.setAttribute("prod_first", "yes");
								RequestDispatcher rd = req.getRequestDispatcher("/product.jsp");
								rd.forward(req, resp);
						
							}
					
					
						}catch(Exception e){
							e.printStackTrace();
						}
						}else {
							
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
					
							PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE item_id = "+item_id+"");
							int result = ps.executeUpdate();
							
							ps.close();
							con.close();
							
							if(result > 0) {
								
								session.setAttribute("prod_first", "yes");
								RequestDispatcher rd = req.getRequestDispatcher("/product.jsp");
								rd.forward(req, resp);
						
							}
					
							
						}
					
					}
					
					st2.close();
					con2.close();
				
					
			}catch(Exception e){
				
					e.printStackTrace();
					
			}
		
	}
	
}
