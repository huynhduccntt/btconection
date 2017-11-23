package wp.zenny.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wp.zenny.dao.CmtDAO;
import wp.zenny.model.ModelUser;

@WebServlet("/Comment")
public class ServletComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletComment() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CmtDAO cmtDAO = new CmtDAO();
		Object user = request.getSession().getAttribute("user");
		if(user == null)
		{
			response.sendRedirect("login.jsp");
			return;
		}
		String action = request.getParameter("action");
		String username = ((ModelUser)user).getUserName();
		if(action.equals("add"))
			AddComment(request, response, cmtDAO, username);
		else if(action.equals("edit")) {
			EditComment(request, response, cmtDAO, username);
		}
		else if(action.equals("delete")) {
			DeleteComment(request, response, cmtDAO);
		}
	}
	
	private void AddComment(HttpServletRequest request, HttpServletResponse response, CmtDAO cmtDAO, String username) throws IOException, ServletException {
		String cmt = request.getParameter("cmt");
		if(cmtDAO.InsertCmt(username, cmt) > 0) {
			request.getSession().setAttribute("add", "true");
		}
		else request.getSession().setAttribute("add", "false");
		response.sendRedirect("AddCmt.jsp");
	}	
	private void EditComment(HttpServletRequest request, HttpServletResponse response, CmtDAO cmtDAO, String username) throws IOException, ServletException {
			String cmt = request.getParameter("cmt");
			int id = Integer.parseInt(request.getParameter("id"));
			if(cmtDAO.UpdateCmt(username, cmt,id) > 0) {
				request.getSession().setAttribute("edit", "true");
			}
			else request.getSession().setAttribute("edit", "false");
		response.sendRedirect("EditCmt.jsp?id="+id);
	}
	
	private void DeleteComment(HttpServletRequest request, HttpServletResponse response, CmtDAO cmtDAO) throws IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(cmtDAO.DeleteCmt(id) > 0) {
			request.getSession().setAttribute("delete", "true");
		}
		else request.getSession().setAttribute("delete", "false");
		response.sendRedirect("ShowGuestBook.jsp");
	}
}
