<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="default.css">
  </head>
  <body>
    
    <div class="jumbotron" style="margin-bottom: 0px;">
      <h1 style="text-align: center;">Hospital Manager</h1>
      <%if (session.getAttribute("username")!=null){ %>
      <p style="text-align: center;">Welcome <%=session.getAttribute("username")%></p>
    </div>
    <div class="clearfix bg-secondary" style="height:57px">
    	<div class="float-left">
	    <nav class="navbar navbar-expand-md navbar-dark bg-secondary row" >
	      <!--a class="navbar-brand"><img src="" alt=""></!--a-->
	      <!-- div class="navbar-text col-1" style="color: black;">Demo</div-->
	      <ul class="navbar-nav" >
	            <li class="nav-item dropdown bg-dark">
	                <a class="nav-link dropdown-toggle bg-secondary" data-toggle="dropdown" data-target="dropdown_target" href="#" style="color: black;">Patient
	                  <span class="caret"></span>
	                </a>
	              <div class="dropdown-menu bg-secondary" aria-labelledby="dropdown_target">
	
	                <a class="dropdown-item bg-secondary" href="addPatient.jsp" style="color: black;">Add Patient</a>
	                
	                <a class="dropdown-item bg-secondary" href="searchForUpdation.jsp" style="color: black;">Update Patient</a>
	                
	                <a class="dropdown-item bg-secondary" href="searchForDeletion.jsp" style="color: black;">Delete Patient</a>
	                
	                <a class="dropdown-item bg-secondary" href="searchPatient.jsp" style="color: black;">Search Patient</a>
	                
	                <a class="dropdown-item bg-secondary" href="HospitalController?source=viewAllPatients" style="color: black;">View All Patient</a>
	                
	                <a class="dropdown-item bg-secondary" href="searchPatientForBilling.jsp" style="color: black;">Search a patient to be billed</a>
	                
	              </div>  
	            </li>
	            
	            <li class="nav-item dropdown bg-dark">
	                <a class="nav-link dropdown-toggle bg-secondary" data-toggle="dropdown" data-target="dropdown_target" href="#" style="color: black;">Pharmacy
	                  <span class="caret"></span>
	                </a>
	              <div class="dropdown-menu bg-secondary" aria-labelledby="dropdown_target">
	
	                <a class="dropdown-item bg-secondary" href="searchPatientAndMedicine.jsp" style="color: black;">Search Medicine details for a patient</a>
	             
	              </div>  
	            </li>
	            
	          <li class="nav-item dropdown bg-dark">
	                <a class="nav-link dropdown-toggle bg-secondary" data-toggle="dropdown" data-target="dropdown_target" href="#" style="color: black;">Diagnostics
	                  <span class="caret"></span>
	                </a>
	              <div class="dropdown-menu bg-secondary" aria-labelledby="dropdown_target">
	
	                <a class="dropdown-item bg-secondary" href="searchPatientAndDiagnostics.jsp" style="color: black;">Search Diagnostics details of a patient</a>
	           
	              </div>  
	            </li>
	            <li class="nav-item bg-dark"> 
					<a class="nav-link bg-secondary " href="admin.jsp" style="color: black;">Home
					</a>
				</li>
	        </ul>
	        <!-- span class="nav-item bg-dark float-right"> 
				<a class="nav-link bg-secondary " href="HospitalController?source=logout" style="color: black;">Logout
				</a>
			</span-->
	    </nav>
	    </div>
	    <div class="float-right"> 
				<a class="nav-link bg-secondary pt-3" href="HospitalController?source=logout" style="color: black;height:57px;">Logout
				</a>
			</div>
	    </div>
	   <%} %>
	    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>