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

@WebServlet("/SendCancellationToVoter")
public class SendCancellationToVoter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String voter_email = request.getParameter("emailID");
		Heyas h = new Heyas();
		System.out.println(voter_email);
	//	h.sendMail(voter_email);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewVoters.jsp");
        dispatcher.forward(request, response); 

	}
	
}