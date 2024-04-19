package in.sp.backend;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/categorie")
public class categorie extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cat = req.getParameter("categorie");
		HttpSession session = req.getSession();
		
		session.setAttribute("cat", cat);
		
		RequestDispatcher rd = req.getRequestDispatcher("/product3.jsp");
		rd.forward(req, resp);
		
	}
	
}
