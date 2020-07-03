<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel Management Service</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="media_functions.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
	<jsp:include page="SessionChecker.jsp"></jsp:include>

<div class="card" style="width: 50%;">
		<div class="container">
				<p style="text-align: center;">
					Tell us your designation in the Hospital?
				</p>
				<div class="text-center d-inline-flex flex-wrap">
					<p class="p-2"> 
						<button type="button" class="btn btn-outline-dark" onclick="document.location='executive.jsp'">Administration desk executive</button>			
					</p>
					<p class="p-2">
						<button type="button" class="btn btn-outline-dark" onclick="document.location='pharmacist.jsp'">Pharmasist</button>			
					</p>
					<p class="p-2">
						<button type="button" class="btn btn-outline-dark" onclick="document.location='diagnostic_executive.jsp'">Diagnostic Service Executive</button>
					</p>
					
				</div>
			</div>
	</div>

	<%@ include file="footer.html" %>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>

