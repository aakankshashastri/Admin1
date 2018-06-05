package com.amazon.dbConnection;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import com.amazon.dbConnection.EmailUtil;

public class Heyas {

	/**
	   Outgoing Mail (SMTP) Server
	   requires TLS or SSL: smtp.gmail.com (use authentication)
	   Use Authentication: Yes
	   Port for TLS/STARTTLS: 587
	 */
	public static void sendMail(String toEmail,String msg) {
		final String fromEmail = "electionportaldummy@gmail.com"; //requires valid gmail id
		final String password = "Election1"; // correct password for gmail id
	//	final String toEmail = "aakankshashastri1998@gmail.com"; // can be any email id 
		
		System.out.println("TLSEmail Start");
		Properties props = System.getProperties();
		props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		props.put("mail.smtp.port", "587"); //TLS Port
		props.put("mail.smtp.auth", "true"); //enable authentication
		props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
		props.put("mail.smtp.user", fromEmail);
		props.put("mail.smtp.password", password);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		
                //create Authenticator object to pass in Session.getInstance argument
		Authenticator auth = new Authenticator() {
			//override the getPasswordAuthentication method
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		Session session = Session.getInstance(props, auth);
		
		EmailUtil.sendEmail(session, toEmail,"TLSEmail Testing Subject",msg);
		
	}

	
}












