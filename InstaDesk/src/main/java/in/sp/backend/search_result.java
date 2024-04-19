package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/search_result")
public class search_result extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String name = req.getParameter("query");
		
		if(name=="") {
			
			RequestDispatcher rd = req.getRequestDispatcher("/product.jsp");
			rd.forward(req, resp);
			
		}else {
			
			session.setAttribute("search_info", name);
			RequestDispatcher rd = req.getRequestDispatcher("/product2.jsp");
			rd.forward(req, resp);
			
		}
		
	}
	
}
