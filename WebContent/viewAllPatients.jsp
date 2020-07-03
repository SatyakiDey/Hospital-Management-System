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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="media_functions.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
	<jsp:include page="SessionChecker.jsp"></jsp:include>

<div class="card" style="width:90%;">
	<div class="container">
		<table>
			<tr>
				<th>Patient ID</th>
				<th>SSN ID</th>
				<th>Patient Name</th>
				<th>Patient Age</th>
				<th>Date of Admission</th>
				<th>Type of Bed</th>
				<th>Address</th>
				<th>City</th>
				<th>State</th>
			</tr>
			<%
					ArrayList<Patient> patientList= (ArrayList<Patient>)(request.getAttribute("patientList"));
					if(patientList!=null && patientList.size()>0)
					{
			%>
			<%
				for(int i=0;i<patientList.size();i++){
					Patient patient=new Patient();
					patient=patientList.get(i);
			%>
			<tr>
				<td><%=patient.getPatientId()%></td>
				<td><%=patient.getSSNId()%></td>
				<td><%=patient.getPatientName()%></td>
				<td><%=patient.getAge()%></td>
				<td><%=patient.getDOJ()%></td>
				<td><%=patient.getBedType()%></td>
				<td><%=patient.getAddress()%></td>
				<td><%=patient.getCity()%></td>
				<td><%=patient.getState()%></td>
				</tr>
				<%
					}
				%>
				
				<%
					}
				%>
				
				
	</table>
		</div>
		<div class="text-center">
			<span><a href="admin.jsp" class="btn btn-info" role="button">Go to home page</a></span> 
	    </div>
		
</div>
	<%@ include file="footer.html" %>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>

