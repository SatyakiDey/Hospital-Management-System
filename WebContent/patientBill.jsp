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
	<form action="HospitalController" method="post" name="BillingForm">
	<div class="row justify-content-center">
		<div class="col-auto">
		  <table>
			
			<%
			  ArrayList<Object> patientBillDetails=(ArrayList<Object>)request.getAttribute("patientBill");
				int total=0;
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
			 	for (Object obj : patientBillDetails) {
			   
			    if (obj.getClass() == Patient.class && c<1) {
			        Patient patient = (Patient) obj;
			%>
			<tr>
				<td><%=patient.getPatientId()%><input type="hidden" name="PatientId" value="<%=patient.getPatientId()%>" id="confirm"></td>
				<td><%=patient.getPatientName()%></td>
				<td><%=patient.getAge()%></td>
				<td><%=patient.getDOJ()%></td>
				<td><%=patient.getBedType()%></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:center"><strong>Number of Days: </strong>7</td>
					<td colspan="2" style="text-align:center"><strong>Bill for Room: </strong><%=patient.getBill() %></td>
				</tr>
				<%
				total=total+patient.getBill();
					c++;
			    	}
				%>
				<%
			    	}
				%>
				
	</table>
	</div>
	<div class="col-auto">
	<table >
			<tr>
				<th>Test Name</th>
				<th>Amount</th> 
			</tr>
			<%
				int s=0;
				for (Object obj : patientBillDetails) {
					if (obj.getClass() == 	Diagnostic.class) {
						Diagnostic diagnostic = (Diagnostic) obj;
			%>
			<tr>
				<td><%=diagnostic.getTestName()%></td>
				<td>Rs. <%=diagnostic.getAmount()%></td>
				</tr>
				<%
					s=s+(diagnostic.getAmount());
					}
					}
				total=total+s;
				%>
				
				<tr>
					<td  style="text-align:center"><strong>Bill for diagnostics: </strong></td>
					<td  style="text-align:center"><%= s%></td>
				</tr>
				
	</table>
	</div>
	
	<div class="col-auto">
	<table>
	<tr>
				<th>Medicine</th>
				<th>Quantity</th>
				<th>Rate</th>
				<th>Amount</th> 
			</tr>
			<%
				int s2=0;
				for (Object obj : patientBillDetails) {
					
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
					s2=s2+(medicine.getAmount());
					}
					}
				total=total+s2;
				%>
				<tr>
					<td colspan="2" style="text-align:center"><strong>Bill for pharmacy: </strong></td>
					<td colspan="2" style="text-align:center"><%= s2%></td>
				</tr>
				
		</table>
		</div>
		
		<div class="col-auto">
		<table style="border:none;background-color: cornsilk">
			<tr style="border:none;background-color: cornsilk">
					<td colspan="2" style="text-align:center; border:none;background-color: cornsilk"><strong>Grand Total </strong></td>
					<td colspan="2" style="text-align:center;border:none;background-color: cornsilk"><%= total%></td>
				</tr>
		</table>
		</div>
		</div>
		<div class="text-center">
			<button type="button" class="btn btn-info" onclick="window.print()">Print</button> <br><br>
			<button type="submit" class="btn btn-primary" style="margin-bottom:10px">Confirm</button>
		</div>
		<input type="hidden" name="action" value="confirm" id="action">
		</form>
		

</div>
</div>
	<%@ include file="footer.html" %>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>

