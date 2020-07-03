<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.bean.*"%> 
  <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel Management Service</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="default.css">
<script type="text/javascript" src="media_functions.js"></script>
<style>
	#diagnostics table,th,td{
		background-color: cornsilk;
		border:none;
		
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<jsp:include page="SessionChecker.jsp"></jsp:include>

<div class="card" style="width:90%;">
	<div class="container">
			<%
			  int patientID=Integer.parseInt(request.getParameter("patientAndDiagnostic")); 

			%>
				<form action="HospitalController" method="post" name="Updation" >	
					<table id="diagnostics">
						<tr>
						<td>
							<label for="diagnostic">Select diagnostic</label>
						</td>	
						<td>
							<div class="form-group">
								<select class="form-control" name="diagnostic" id="diagnostic1">
								  <option value="">Select</option>
								  <option value="Blood Test">Blood Test</option>
								  <option value="X-Ray">X-Ray</option>
								  <option value="MRI">MRI</option>
								</select>
								<div class="invalid-feedback">Select an option</div>
							</div>
						</td>
					  </tr>
					  <tr>
					  <td>
					  	<button type="button" class="btn btn-primary"  onclick="searchIt()">Search</button>
					  </td>
					  </tr>
					  <!-- tr>
						<td colspan="2" style="text-align:center;"><input type="button" class="btn btn-primary" value="Add another artist" onclick="addRow()"></td>
					  </tr-->
							
				</table>
				<div class="text-align">
						<input type="hidden" name="search" value="diagnosticTest" id="searchParam">
						<input type="hidden" name="medName" id="medName">
						<input type="hidden" name="action" value="updateDiagnostics" id="action">
						<button type="submit" class="btn btn-primary">Update</button>
				</div>
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

