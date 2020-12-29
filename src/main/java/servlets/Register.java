package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.servlets.Dbcon.Profile;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Requests...
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String email = request.getParameter("emailaddress");
		String password = request.getParameter("passkey");
		String cnfrm = request.getParameter("confirmedpswd");

		Profile reg = new Profile(firstname, lastname, username, email, password);
		Dbcon model = new Dbcon();
		String modelop = "";
		try {
			modelop = model.Allchecks(reg);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (!password.equals(cnfrm)) {
			request.setAttribute("check", "Passwords didn't match!");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else if (modelop.equals("ok")) {
			request.setAttribute("check", modelop);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			request.setAttribute("check", modelop);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("login.jsp");
	}

}
