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
</head>
<body>
	<%@ include file="header.jsp" %>
	<jsp:include page="SessionChecker.jsp"></jsp:include>
	
	<div class="card">
		<div class="container">
				<form action="HospitalController" method="post" name="MedicineDetails" class="needs-validation" novalidate>	
								
						<div class="form-group">
							<input type="text" name="PatientId" id="PatientId" class="form-control" pattern="^([A-Za-z]{1,})$" required placeholder="Enter patient Id">
							<input type="text" name="medicineName" id="medicineName" class="form-control" pattern="^([A-Za-z0-9]{1,})$" required placeholder="Enter medicne to be added">
							<input type="text" name="medicineQuantity" id="medicineQuantity" class="form-control" pattern="^([0-9]{1,})$" required placeholder="Enter quantity of to be added">
						</div>
						
						<input type="hidden" name="action" value=searchPatient id="action">
						<button type="submit" class="btn btn-primary">Search medicine</button>
		
				</form>
				<form action="HospitalController" method="post" name="MedicineList" class="needs-validation" novalidate>
				<table>
						<tr>
							<th>Medicine Name</th>
							<th>Quantity</th>
							<th>Rate</th>
							<th>Amount</th>
						</tr>
				<%
						ArrayList<Medicine> medicineList= (ArrayList<Medicine>)(request.getAttribute("medicineList"));
						if(medicineList!=null && medicineList.size()>0)
						{
				%>
				<%
					for(int i=0;i<medicineList.size();i++){
						Medicine medicineToBeAdded=new Medicine();
						medicineToBeAdded=medicineList.get(i);
						medicineToBeAdded.setAmount((medicineToBeAdded.getQuantity())*(medicineToBeAdded.getQuantity()));
				%>
				<tr>
					<td><span><%=medicineToBeAdded.getMedicineName()%></span><input type="hidden" name="medicine" value="<%=medicineToBeAdded.getMedicineName()%>"></td>
					<td><span><%=medicineToBeAdded.getQuantity()%></span><input type="hidden" name="quantity" value="<%=medicineToBeAdded.getQuantity()%>"></td>
					<td><%=medicineToBeAdded.getRate()%></td>
					<td><%=medicineToBeAdded.getAmount()%></td>
				</tr>
					
					<%
						}
					%>
					
					
					<%
						}
					%>	
			</table>
					
							<button type="submit" class="btn btn-primary">Update</button>
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