package wp.zenny.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wp.zenny.dao.UserDAO;
import wp.zenny.model.ModelUser;
@WebServlet("/Login")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletLogin() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDAO userDAO = new UserDAO();
		if(session.getAttribute("user") != null) {
			response.sendRedirect("ShowGuestBook.jsp");
			return;
		}
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String fullname = userDAO.CheckLogin(username, pwd);
		if(fullname == "") {
			response.sendRedirect("login.jsp");
			return;
		}
		ModelUser user = new ModelUser(username, fullname);
		session.setAttribute("user", user);
		response.sendRedirect("ShowGuestBook.jsp");
	}

}
