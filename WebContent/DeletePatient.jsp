<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.bean.*"%>
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
	<%
		Patient patient=(Patient)(request.getAttribute("patientToBeDeleted"));
	%>
	<div class="card">
		<div class="container">
				<form action="HospitalController" method="post" name="UpdationForm" class="needs-validation" novalidate>	
								
								<div class="form-group">
									<label for="PatientId">Patient ID</label>
									<input type="text" name="PatientId" id="PatientId" class="form-control"  value="<%=patient.getPatientId() %>" disabled>
								</div>
								
								<div class="form-group">
									<label for="name">Patient Name</label>
									<input type="text" name="name" id="name" class="form-control" value="<%=patient.getPatientName() %>" disabled>
								</div>
							
								<div class="form-group">
									<label for="age">Patient Age</label>
									<input type="text" name="age" id="age" class="form-control" value="<%=patient.getAge() %>" disabled>
								</div>
								
								<div class="form-group">
									<label for="DOJ">Date of Joining</label>
									<input type="text" name="DOJ" id="DOJ" class="form-control" value="<%=patient.getDOJ() %>" disabled>
								</div>
							
								<div class="form-group">
									<label for="BedType">Type of Bed</label>
									<select class="form-control" name="BedType" id="BedType" disabled>
									  <option value="<%=patient.getBedType() %>"><%=patient.getBedType() %></option>
									  <option value="General ward">General ward</option>
									  <option value="Semi sharing">Semi Sharing</option>
									  <option value="Single room">Single room</option>
									</select>
								  </div>
								  
								  <div class="form-group">
										<label for="address">Address</label>
										<textarea class="form-control" rows="5" name="address" id="address" disabled><%=patient.getAddress() %></textarea>
							 	 </div>
								
								 <div class="form-group">
									<label for="city">City</label>
									<input type="text" name="city" id="city" class="form-control" value="<%=patient.getCity() %>" disabled>
								 </div>
								 
								  <div class="form-group">
									<label for="state">State</label>
									<input type="text" name="state" id="state" class="form-control" value="<%=patient.getState() %>" disabled>
								 </div>
								 
								 
								<input type="hidden" name="Id" value="<%=patient.getPatientId() %>" id="PatientId">
								<input type="hidden" name="action" value="delete" id="action">
												
								<button type="submit" class="btn btn-primary">Delete</button>
							
				</form>
				
			</div>
		  </div>
<%@ include file="footer.html" %>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
</body>
</html>