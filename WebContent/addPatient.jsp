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
</head>
<body>
<%@ include file="header.jsp" %>
<jsp:include page="SessionChecker.jsp"></jsp:include>
<div class="card">
	<div class="container">
			<h3>Patient Registration</h3>
				<form action="HospitalController" method="post" name="RegistrationForm" class="needs-validation" novalidate>
					<div class="form-group">
					
						<label for="SSNId">Patient SSN ID</label>
						<input type="text" name="SSNId" id="SSNId" class="form-control" required pattern="^([0-9]{1,9})$">
						<div class="invalid-feedback">Enter only numbers</div>
					</div>
					<div class="form-group">
						<label for="name">Patient Name</label>
						<input type="text" name="name" id="name" class="form-control" required text>
						<div class="invalid-feedback">Enter only alphabets</div>
					</div>
					<div class="form-group">
						<label for="age">Patient Age</label>
						<input type="text" name="age" id="age" class="form-control" required pattern="^([0-9]{1,3})$">
						<div class="invalid-feedback">Enter only numbers</div>
					</div>					
					<div class="form-group">
						<label for="DOJ">Date of admission</label>
						<input type="text" name="DOJ" id="DOJ" class="form-control" required pattern="^(\d{4}-\d{2}-\d{2})$">
						<div class="invalid-feedback">Enter date in the format YYYY-MM-DD</div>
					</div>
					<div class="form-group">
						<label for="BedType">Type of Bed</label>
						<select class="form-control" name="bedType" id="BedType" required>
						  <option value="">Select</option>
						  <option value="General ward">General ward</option>
						  <option value="Semi sharing">Semi Sharing</option>
						  <option value="Single room">Single room</option>
						</select>
						<div class="invalid-feedback">Select an option</div>
					  </div>
					<div class="form-group">
						<label for="address">Address</label>
						<textarea class="form-control" rows="5" name="address" id="address" required pattern="^([a-zA-Z0-9]){1,}$"></textarea>
						<div class="invalid-feedback">Address is required</div>
					  </div>
					  <div class="form-group">
						<label for="city">City</label>
						<select class="form-control" name="city" id="city" required>
						  <option value="">Select</option>
						  <option value="Kolkata">Kolkata</option>
						  <option value="Bangalore">Bangalore</option>
						  <option value="Pune">Pune</option>
						</select>
						<div class="invalid-feedback">Select an option</div>
					  </div>
					  <div class="form-group">
						<label for="State">Select list:</label>
						<select class="form-control" name="state" id="State" required>
							<option value="">Select</option>
							<option value="West Bengal">West Bengal</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Pune">Maharashtra</option>
						</select>
						<div class="invalid-feedback">Select an option</div>
					  </div>
					<input type="hidden" name="action" value="addPatient" id="action">
					
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
				<h2 style="color:green">
					<%
					     Object id=(Integer)request.getAttribute("patientId");
						if(id!=null){
							out.println("<br>Patient Registered Successfully.<br>");
							out.println("<br>Patient Id: <u>" +id+"</u>");
						}
					%>
				</h2>
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

