<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE HTML>
<html>
	<head>
	<script type="text/javascript">
window.onbeforeload = function(){
	window.location.replace("viewreq.jsp");
}
</script>
			<script src="js/jquery.min.js"></script>
			<script src="js/jquery.scrollex.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>
		<title>
			View Requests
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
<h2 align="center"><font><strong>Pending Candidate Requests</strong></font></h2>
<table align="center" cellpadding="25" cellspacing="25" border="2" width = "100%">
<tr>

</tr>

<%
try{ 
	
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1234");
	statement=connection.createStatement();
	String sql ="SELECT candidate_id,E_id,party_name FROM Candidates where status = 0";
	resultSet = statement.executeQuery(sql);
	 if (resultSet.next() == false) {
%>
	<h3 align="center"><font><strong>No Pending Candidate Requests</strong></font></h3>
<% 
	        return ;
	      } else {
%>
			<tr bgcolor="#FFF8DC">
				<td  width = "20%"><b>Candidate Id</b></td>
				<td width = "20%"><b>Election Id</b></td>
				<td width = "20%"><b>Party Name</b></td>
				<td width = "20%"><b></b></td>
				<td widtg = "20%"><b></b></td>	
			</tr>
<% 		
	        do {
	        
%>
		<tr bgcolor="#F0FFFF">

			<td><%=resultSet.getString("candidate_id") %></td>
			<td><%=resultSet.getString("E_id") %></td>
			<td><%=resultSet.getString("party_name") %></td>
			<td><a href="acceptedDB.jsp?id=<%=resultSet.getString("candidate_id")%>">Accept</a></td>
			<td><a href="rejectCandidate.jsp?id=<%=resultSet.getString("candidate_id")%>">Reject</a></td>

		</tr>

<% 
	        } while (resultSet.next());
	      }
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


	</body>
</html>