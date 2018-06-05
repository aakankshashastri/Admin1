<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<% 
	String id = request.getParameter("id");
	String emailID = null; 
	Connection con = null;
	Statement ps = null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1234");
		ps = con.createStatement();
		String sql = "select emailId from User where voter_id = '"+id+"' ";
		ResultSet rs = ps.executeQuery(sql);
		if(rs.next()) {
			emailID = rs.getString("emailId");			
		}
		String sql1 = "Update User set status=-1 where voter_id= '"+id+"' ";
		ps = con.createStatement();
		int res = ps.executeUpdate(sql1);
		if(res > 0)
			System.out.println("UPDATED!!");
	}	catch(SQLException sql) {
		out.println("no connection");
	}
	
	
	RequestDispatcher rd = getServletContext().getRequestDispatcher("/SendCancellationToVoter?emailID="+emailID);
	rd.forward(request, response);   
%>

