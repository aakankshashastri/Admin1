package com.amazon.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amazon.dbConnection.LoginDAO;

@WebServlet("/UserLoginController")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userID");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		session.setAttribute("customerID", userName);
		request.setAttribute("customerID", userName);

		LoginDAO loginDAO = new LoginDAO();
		try {
			boolean result = loginDAO.validate(userName, password);
			if (result) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.html");
				requestDispatcher.forward(request, response);

			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User or password incorrect');");
				out.println("location='welcomepage.html';");
				out.println("</script>");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	

}
