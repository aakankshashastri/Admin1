<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE HTML>
<html>
	<head>
			<script src="js/jquery.min.js"></script>
			<script src="js/jquery.scrollex.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>
		<title>
			View Voters
		</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="CSS/main.css" />
	</head>
	<body>
			<header id="header" class="alt">
				<a href="#menu">Menu</a>
			</header>
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="CreateElection.jsp">Create Election</a></li>
					<li><a href="viewreq.jsp">View Requests</a></li>
					<li><a href="ViewVoters.jsp">View Voters</a></li>					
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</nav>
			<section class="banner full">
				<article>
					<img src="images/ad2.jpg" alt="" />
					<div class="inner">
						<header>
							<h2>Welcome Admin</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="images/samplebg.jpg"  alt="" />
					<div class="inner">
						<header>
							
							<h2>Welcome Admin</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="images/slide04.jpg"  alt="" />
					<div class="inner">
						<header>
							 
							<h2>Welcome Admin</h2>
						</header>
					</div>
				</article>
			</section>

		

<%



try {
	Class.forName("com.mysql.jdbc.Driver");
	
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Voters List</strong></font></h2>
<table align="center" cellpadding="25" cellspacing="25" border="2" width = "100%">
<tr>

</tr>

<%
try{ 
	
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1234");
	statement=connection.createStatement();
	String sql ="SELECT voter_id,uname,emailId FROM User where status = 1";
	resultSet = statement.executeQuery(sql);
%>
			<tr bgcolor="#FFF8DC">
				<td  width = "20%"><b>Voter Id</b></td>
				<td width = "20%"><b>Name</b></td>
				<td width = "20%"><b>Email ID</b></td>
				<td width = "20%"><b></b></td>
			</tr>
			
<% 		while (resultSet.next()) { 
			
%>
		<tr bgcolor="#F0FFFF">

			<td><%=resultSet.getString("voter_id") %></td>
			<td><%=resultSet.getString("uname") %></td>
			<td><%=resultSet.getString("emailId") %></td>
			<td><a href="rejectVoter.jsp?id=<%=resultSet.getString("voter_id")%>">Cancel Voter</a></td>

		</tr>

<% } 
	      
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


	</body>
</html>