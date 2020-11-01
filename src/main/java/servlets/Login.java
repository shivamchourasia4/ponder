package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("passkey");
		
		Dbcon model = new Dbcon();
		String modelop="";
		
		 try {
			modelop = model.TryLogin(username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 if(modelop.equals("ValidUser"))
		 {
			 HttpSession session = request.getSession();
			 session.setAttribute("username", username);
			 response.sendRedirect("welcome.jsp");
		 }
		 else {
			 request.setAttribute("wrongio", modelop);
			 request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
