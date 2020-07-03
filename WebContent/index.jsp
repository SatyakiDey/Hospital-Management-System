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
<div class="card">
	<div class="container">
		<%String errMessage =(String) request.getAttribute("message");%>
			<h3>User Login</h3>
				<form action="HospitalController" method="post" name="LoginForm" class="needs-validation" novalidate>
					<%if(errMessage != null) {%>
					<h4 style="color:red"><%=errMessage%></h4><%} %>
					<div class="form-group">
						<input type="text" name="username" class="form-control border-top-0 border-right-0 border-left-0" style="background-color: cornsilk" id="username" required pattern="(^[a-zA-Z0-9]{8,}$)" aria-describedby="IdHelpBlock" placeholder="Login ID">
						<small id="IdHelpBlock" class="form-text text-muted">Your Login ID must be atleast 8 characters long ,containing letters or numbers.</small>
						<div class="invalid-feedback">Enter correct username</div>
					</div>
					<div class="form-group input-group" >
						<input type="password" name="password" id="password" class="form-control border-top-0 border-right-0 border-left-0" style="background-color: cornsilk" required size="10" pattern="(^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[#$_*&%^+?|@!,.-])[a-zA-Z0-9_%+#&?$|.*^@!,-]{10}$)" aria-describedby="PasswordHelpBlock" placeholder="Password">
						<span class="material-icons visibility input-group-addon ml-2" style="cursor:default;" onclick="toggle()">visibility_off</span>						
						<small id="PasswordHelpBlock" class="form-text text-muted">Password should contain 10 characters including one special character, one upper case, one numeric.</small>
						<div class="invalid-feedback">Enter correct password</div>
					</div>
					<input type="hidden" name="action" value="login" id="action">
					
					<button type="submit" class="btn btn-primary">Login</button>
				</form>
		</div>
</div>
	<%@ include file="footer.html" %>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
	
	<script>
	(function() {
		window.addEventListener('load', function() {
		// Fetch all the forms we want to apply custom Bootstrap validation styles to
		var forms = document.getElementsByClassName('needs-validation');
		// Loop over them and prevent submission
		var validation = Array.prototype.filter.call(forms, function(form) {
		form.addEventListener('submit', function(event) {
		if (form.checkValidity() === false) {
		event.preventDefault();
		event.stopPropagation();
		}
		form.classList.add('was-validated');
		});
		});
		});
		})();
	</script>

</body>
</html>

