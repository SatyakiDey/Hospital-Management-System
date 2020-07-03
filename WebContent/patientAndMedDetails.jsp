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
	<div class="row justify-content-center">
	<div class="col-auto">
		<h2 style="text-align:center">Pharmacy</h2>
		<table>
			
			<%
			  ArrayList<Object> patientAndMedicine=(ArrayList<Object>)request.getAttribute("patientAndMedicine");

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
			 	for (Object obj : patientAndMedicine) {
			   
			    if (obj.getClass() == Patient.class && c<1) {
			        Patient patient = (Patient) obj;
			%>
			<tr>
				<td><%=patient.getPatientId()%></td>
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
	<h2 style="text-align:center">Medicines issued</h2>
	<table>
			<tr>
				<th>Medicine</th>
				<th>Quantity</th>
				<th>Rate</th>
				<th>Amount</th> 
			</tr>
			<%
				for (Object obj : patientAndMedicine) {
					
					if (obj.getClass() == Medicine.class) {
						Medicine medicine = (Medicine) obj;
			%>
			<tr>
				<td><%=medicine.getMedicineName()%></td>
				<td>Rs. <%=medicine.getQuantity()%></td>
				<td>Rs. <%=medicine.getRate()%></td>
				<td>Rs. <%medicine.setAmount(medicine.getQuantity()*medicine.getRate());%>
					<%=medicine.getAmount() %>
				</td>
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
		</div>
		<!--  div class="text-center">
			<span><a href="#" class="btn btn-info" role="button">Issue Medicines</a></span> 
	    </div-->
		
</div>
	<%@ include file="footer.html" %>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>

