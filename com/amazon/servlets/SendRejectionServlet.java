package com.amazon.servlets;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amazon.dbConnection.Heyas;

@WebServlet("/SendRejectionServlet")
public class SendRejectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String candidate_email = request.getParameter("emailID");
		Heyas h = new Heyas();
		System.out.println(candidate_email);
		h.sendMail(candidate_email,"Sorry, your request has been disapproved!");
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewreq.jsp");
        dispatcher.forward(request, response); 

	}
	
}