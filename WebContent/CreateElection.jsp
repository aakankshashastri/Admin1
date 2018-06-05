<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Election Management System</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/welcomepage.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body >

	

			<!-- Modal content-->
			<section class="modal-content">
				<section class="modal-header" style="padding: 50px 60px;">
					<h2>
						<span class="glyphicon glyphicon-lock"></span>Create Election
					</h2>
				</section>

				<section class="modal-body" style="padding: 180px 100px;">
					<form role="form" action="CreateElectionController" method="post">
						<section class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-pencil"></span>Election ID</label> <input
								type="text" class="form-control" name="eid"
								placeholder="Enter Election Id" required>
						</section>
						
						<section class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-map-marker"></span>Location</label> <input
								type="text" class="form-control" name="location"
								placeholder="Enter Location" required>
						</section>
						
						<section class="form-group">
							<label for="post"><span
								class="glyphicon glyphicon-user"></span>Post</label> <input
								type="text" class="form-control" name="post"
								placeholder="Enter Post" required>
						</section>
						<section class="form-group">
							<label for="start_time"><span
								class="glyphicon glyphicon-time"></span>Start Time</label> <input
								type="text" class="form-control" name="start_time"
								placeholder="Enter Start Time" required>
						</section>
						<section class="form-group">
							<label for="end_time"><span
								class="glyphicon glyphicon-eye-open"></span>End Time</label> <input
								type="text" class="form-control" name="end_time"
								placeholder="Enter End Time" required>
						</section>

						<button type="submit" class="btn btn-basic btn-block" >
							<span class="glyphicon glyphicon-off"></span> Submit
						</button>

					</form>
				</section>

				
			</section>


	<script>
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
			});
		});
	</script>
</body>
</html>
 