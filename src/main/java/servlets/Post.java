package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Post
 */
@WebServlet("/Post")
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Dbcon model = new Dbcon();
		HttpSession session = request.getSession();
		String topic = (String) request.getParameter("topic");
		String post = (String) request.getParameter("posthis");
		String user = (String) session.getAttribute("username");
		// System.out.println(topic+" "+post+" "+user);

		try {
			model.PostStuff(post, topic, user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("welcome.jsp");
	}

}
