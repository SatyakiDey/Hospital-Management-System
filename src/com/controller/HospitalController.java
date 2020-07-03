package com.controller;

import java.io.*;
import javax.servlet.http.*;


import javax.servlet.*;

import com.CustomException.NoPatientException;
import com.bean.*;
import com.util.DateUtil;
import com.service.*;
//import com.util.LoggerUtil;

import java.sql.SQLException; 
import java.util.ArrayList;
import java.util.Map;



public class HospitalController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String source=request.getParameter("source");
		
		//To display the session invalid message when user tries to access a link without logging in
		if(source == null) 
		{
		HttpSession session=request.getSession();
		session.invalidate();
		request.setAttribute("message", "Invalid Session. Please login again");
		RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
		 rd.forward(request, response);
		}
		
		//Implementing logout functionality

		if(source.equals("logout")) 
		{
		HttpSession session=request.getSession();
		session.invalidate();
		request.setAttribute("message", "Logged out successfully.");
		RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
		 rd.forward(request, response);
		}
		
		//Implementing view all "Active" patients functionality
		
		 if(source.equals("viewAllPatients"))
		 {
			 HospitalService service = new HospitalService();
			 ArrayList<Patient> patientList= new ArrayList<Patient>();
			 
			 try {
				 patientList=service.getAllPatients();
				 request.setAttribute("patientList", patientList);
				 RequestDispatcher rd2=  request.getRequestDispatcher("viewAllPatients.jsp");
				 rd2.forward(request, response);
				}
			catch (ClassNotFoundException  | SQLException e)
			{
				 e.printStackTrace();
			}
			 
			 }
		}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		HospitalService service = new HospitalService();
		String source=request.getParameter("action");
		
		//Implementing adding new patient functionality
		
		 if(source.equals("addPatient")) {

			Patient patient=new Patient();
			
			patient.setSSNId(Integer.parseInt(request.getParameter("SSNId")));
			patient.setPatientName(request.getParameter("name"));
			patient.setAge(Integer.parseInt(request.getParameter("age")));
			patient.setDOJ(DateUtil.convertStringToDate(request.getParameter("DOJ"),"YYYY-MM-dd"));
			patient.setBedType(request.getParameter("bedType"));
			patient.setAddress(request.getParameter("address"));
			patient.setState(request.getParameter("state"));
			patient.setCity(request.getParameter("city"));
			patient.setStatus("Active");

			try {

				Object id=service.addPatient(patient);
				
				if(id!=null) {
					request.setAttribute("patientId",id);
				RequestDispatcher rd=request.getRequestDispatcher("addPatient.jsp");
				rd.forward(request, response);}
			}
				catch (ClassNotFoundException  | SQLException e)
				{
					 e.printStackTrace();
				}
			}
		 
		//Implementing login functionality
		 else if(source.equals("login")){
			 try {
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				
				boolean isValid=service.validateLogin(username,password);
				
				if(isValid) {
					HttpSession session= request.getSession();
					session.setAttribute("username", username);
					RequestDispatcher rd= request.getRequestDispatcher("admin.jsp");
					rd.forward(request, response);
				}
				else{
					request.setAttribute("message", "Invalid Login Credentials");
					RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}
				}
			 catch (ClassNotFoundException  | SQLException e)
				{
					 e.printStackTrace();
				}
		 }
		 
		//Implementing updating existing patient functionality
		 else if(source.equals("update")) {
				
			    Patient patient=new Patient();
			    
			    //System.out.println(request.getParameter("bedType"));
				
			    patient.setPatientId(Integer.parseInt(request.getParameter("PatientId")));
				patient.setPatientName(request.getParameter("PatientName"));
				patient.setAge(Integer.parseInt(request.getParameter("age")));
				patient.setDOJ(DateUtil.convertStringToDate(request.getParameter("DOJ"),"YYYY-MM-dd"));
				patient.setBedType(request.getParameter("bedType"));
				patient.setAddress(request.getParameter("address"));
				patient.setState(request.getParameter("state"));
				patient.setCity(request.getParameter("city"));
				
				try {
					
					boolean status=service.updatePatient(patient); 
				
					if(status == true)
					{
						RequestDispatcher rd=request.getRequestDispatcher("update_success.jsp");
					    rd.forward(request, response);
					}
					
					if(status == false) {
						 
						  RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
						  rd.forward(request, response);
					 }

				}
					catch (ClassNotFoundException  | SQLException e)
					{
						 e.printStackTrace();
					}
				}
		 
		//Implementing deleting existing patient functionality
		 
	 else if(source.equals("delete")) {
		 
		 try {
			 String id=request.getParameter("Id");
			 boolean status;
			 status=service.deletePatient(Integer.parseInt(id));
			 
			 if(status == true) {
				 
				  RequestDispatcher rd=request.getRequestDispatcher("delete_success.jsp");
				  rd.forward(request, response);
			 }
			 
			 if(status == false) {
				 
				  RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
				  rd.forward(request, response);
			 }
		 }
		 catch (ClassNotFoundException  | SQLException e) {
			 e.printStackTrace();
		}
	 }
	 
		//Implementing searching existing patient to be updated functionality
   else if(source.equals("searchforUpdation")) {
 	  
 	  try {
 		 
 			  Patient patient = new Patient();
 		  	  String id=request.getParameter("PatientId");
 		  	  
 		  	  if(id!=null) {
 			  patient=service.getPatientById(Integer.parseInt(id));
 			  request.setAttribute("patientToBeUpdated",patient);
 			  RequestDispatcher rd=request.getRequestDispatcher("UpdatePatient.jsp");
 			  rd.forward(request,response);}
 		  	  
 		  	  if(id==null) {
 		  		RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
	 			  rd.forward(request,response);
 		  	  }
 			  
 		  }
 	 catch (ClassNotFoundException  | SQLException e) {
		 e.printStackTrace();
	}
 	 catch(NoPatientException e) {
 		 RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
		  rd.forward(request,response);
		 System.out.println(e.getMessage());

	 }
   }
		//Implementing searching existing patient to be deleted functionality
   else if(source.equals("searchforDeletion")) {
	 	  	 	  
	 	  try {
	 		  	 			  
	 			  String id=request.getParameter("PatientId");
	 			  Patient patient=service.getPatientById(Integer.parseInt(id));
	 			  
	 			 if(patient!=null) {
	 			  request.setAttribute("patientToBeDeleted",patient);
	 			  RequestDispatcher rd=request.getRequestDispatcher("DeletePatient.jsp");
	 			  rd.forward(request,response);}
	 			 
	 			if(patient==null) {
	 		  		RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
		 			  rd.forward(request,response);
	 		  	  }
	 			  
	 		  }
	 	 catch (ClassNotFoundException  | SQLException e) {
			 e.printStackTrace();
		}
	 	 catch(NoPatientException e) {
	 		RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
			  rd.forward(request,response);
			 System.out.println(e.getMessage());

		 }
	   }
		//Implementing searching existing patient functionality
   else if(source.equals("searchPatient")) {
	 	  
	 	  try {
	 		  	 			  
	 			  String id=request.getParameter("PatientId");
	 			  Patient patient=service.getPatientById(Integer.parseInt(id));
	 			  
	 			  if(patient!=null) {
	 			  request.setAttribute("searchedPatient",patient);
	 			  RequestDispatcher rd=request.getRequestDispatcher("searchedPatient.jsp");
	 			  rd.forward(request,response);}
	 			 
	 			 if(patient==null) {
		 		  		RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
			 			  rd.forward(request,response);
		 		  	  }
	 			  
	 		  }
	 	 catch (ClassNotFoundException  | SQLException e) {
			 e.printStackTrace();
		}
	 	 catch(NoPatientException e) {
	 		RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
			  rd.forward(request,response);
			 System.out.println(e.getMessage());

		 }
	   }
		//Implementing searching medicine details for existing patient functionality
   else if(source.equals("searchPatientAndMedicine")) {
	 	  
	 	  try {
	 		  	 			  
	 			  String patientId=request.getParameter("PatientId"); 
	 			  ArrayList<Object> patientAndMedicine=service.patientAndMedicine(Integer.parseInt(patientId));
	 			  
	 			 if(!patientAndMedicine.isEmpty()) {
	 			  request.setAttribute("patientAndMedicine",patientAndMedicine);
	 			  RequestDispatcher rd=request.getRequestDispatcher("patientAndMedDetails.jsp");
	 			  rd.forward(request,response);}
	 			  
	 			 else if(patientAndMedicine.isEmpty()) {
		 			  RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
		 			  rd.forward(request,response);}
	 			  
	 		  }
	 	 catch (ClassNotFoundException  | SQLException e) {
			 e.printStackTrace();
		}
	 	 
	   }
			//Implementing searching diagnostic details for existing patient functionality

   else if(source.equals("searchPatientAndDiagnostic")) {
	 	  
	 	  try {
	 		  	 			  
	 			  String patientId=request.getParameter("PatientId"); 
	 			  ArrayList<Object> patientAndDiagnostic=service.patientAndDiagnostic(Integer.parseInt(patientId));
	 			  
	 			 if(!patientAndDiagnostic.isEmpty()) {
	 			  request.setAttribute("patientAndDiagnostic",patientAndDiagnostic);
	 			  RequestDispatcher rd=request.getRequestDispatcher("PatientAndDiagnosticsDetails.jsp");
	 			  rd.forward(request,response);}
	 			  
	 			else if(patientAndDiagnostic.isEmpty()) {
		 			  RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
		 			  rd.forward(request,response);}
	 			  
	 			  
	 		  }
	 	 catch (ClassNotFoundException  | SQLException e) {
			 e.printStackTrace();
		}
	 	 
	   }
			//Implementing raising bill for existing patient functionality

   else if(source.equals("searchPatientBill")) {
	 	  
	 	  try {
	 		  	 			  
	 			  String patientId=request.getParameter("PatientId"); 
	 			  ArrayList<Object> patientBill=service.getPatientBill(Integer.parseInt(patientId));
	 			  
	 			 if(!patientBill.isEmpty()) {
	 			  request.setAttribute("patientBill",patientBill);
	 			  RequestDispatcher rd=request.getRequestDispatcher("patientBill.jsp");
	 			  rd.forward(request,response);}
	 			 
	 			 else if(patientBill.isEmpty()) {
		 			  RequestDispatcher rd=request.getRequestDispatcher("errorPage.jsp");
		 			  rd.forward(request,response);}
	 			  
	 		  }
	 	 catch (ClassNotFoundException  | SQLException e) {
			 e.printStackTrace();
		}
	 	 
	   }
			//Setting status existing patient to "Discharged"

	
   else if(source.equals("confirm")) {
	 	  
	 	  try {
 			  	  String id=request.getParameter("PatientId"); 
	 			  boolean status=service.setPatientAsDischarged(Integer.parseInt(id));
	 			  
	 			  if(status == true) {
	 			  RequestDispatcher rd=request.getRequestDispatcher("billing_success.jsp");
	 			  rd.forward(request,response);}
	 			  
	 		  }
	 	 catch (ClassNotFoundException  | SQLException e) {
			 e.printStackTrace();
		}
	 	 
	   }
		
	}
}