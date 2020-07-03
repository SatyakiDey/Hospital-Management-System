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
</head>
<body>
<%@ include file="header.jsp" %>
	<jsp:include page="SessionChecker.jsp"></jsp:include>

<div class="card" style="width:90%;">
	<div class="container">
	<form action="issueDiagnostics.jsp" method=post>
	<div class="row justify-content-center">
		<div class="col-auto">
		<h2 style="text-align:center">Diagnostics</h2>
		<table>
			
			<%
			  ArrayList<Object> patientAndDiagnostic=(ArrayList<Object>)request.getAttribute("patientAndDiagnostic");

			%>
			
			<tr>
				<th>Patient ID</th>
				<th>Patient Name</th>
				<th>Patient Age</th>
				<th>Date of Admission</th>
				<th>Type of Bed</th>
			</tr>
			<%
				int c=0;
			 	for (Object obj : patientAndDiagnostic) {
			   
			    if (obj.getClass() == Patient.class && c<1) {
			        Patient patient = (Patient) obj;
			%>
			<tr>
				<td><%=patient.getPatientId()%>	<input type="hidden" name="patientAndDiagnostic" value="<%=patient.getPatientId() %>"></td>
				<td><%=patient.getPatientName()%></td>
				<td><%=patient.getAge()%></td>
				<td><%=patient.getDOJ()%></td>
				<td><%=patient.getBedType()%></td>
				<%
					c++;
			    	}
				%>
				</tr>
				<%
			    	}
				%>
				
				
	</table>
	</div>
	
	<div class="col-auto">
	<h2 style="text-align:center">Diagnostic Conducted</h2>
	<table>
			<tr>
				<th>Test Name</th>
				<th>Amount</th> 
			</tr>
			<%
				for (Object obj : patientAndDiagnostic) {
					
					if (obj.getClass() == 	Diagnostic.class) {
						Diagnostic diagnostic = (Diagnostic) obj;
			%>
			<tr>
				<td><%=diagnostic.getTestName()%></td>
				<td>Rs. <%=diagnostic.getAmount()%></td>
				<%
					}
				%>
				</tr>
				<%
					}
				%>
				
	</table>
	</div>
	</div>
	<%
	  //request.setAttribute("patientAndDiagnostic",patientAndDiagnostic);
		
	%>
		<!-- div class="text-center">
			<button type="submit" class="btn btn-primary">Issue Diagnostics</button>
	    </div-->
	    </form>
		
		</div>
		
</div>
	<%@ include file="footer.html" %>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>

