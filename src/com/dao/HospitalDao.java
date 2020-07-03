package com.dao;

import com.util.*;
import com.CustomException.NoPatientException;
import com.bean.*;
import java.sql.SQLException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class HospitalDao {
	
	Connection con=null;
	PreparedStatement ps=null,ps2=null,ps3=null;
	
	//Validating login credentials functionality

	public boolean validateLogin(String username,String password) throws SQLException, ClassNotFoundException{
		con=DatabaseUtil.getConnection();
		boolean isValid=false;
		ps=con.prepareStatement("select 1 from userstore where LOGIN=? AND PASSWORD=?");
		ps.setString(1, username);
		ps.setString(2,password);
		
		ResultSet result=ps.executeQuery();
		
		if(result.next()) {
			isValid=true;
		}
		
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		return isValid;
	}
	
	//Updating the database by adding a new patient.
	
	public int addPatient(Patient patient) throws SQLException, ClassNotFoundException{
		con=DatabaseUtil.getConnection();
		int id=0;		
		ps=con.prepareStatement("insert into patients(SSN_ID,Name,Age,DOJ,Bed_type,Address,City,State,Status) values (?,?,?,?,?,?,?,?,?)");
		
		ps.setInt(1, patient.getSSNId());
		ps.setString(2,patient.getPatientName());
		ps.setInt(3,patient.getAge());
		ps.setDate(4, new java.sql.Date(patient.getDOJ().getTime()));
		ps.setString(5,patient.getBedType());
		ps.setString(6,patient.getAddress());
		ps.setString(7,patient.getCity());
		ps.setString(8,patient.getState());
		ps.setString(9,patient.getStatus());

		
		ps.executeUpdate();
		
		ps2=con.prepareStatement("select MAX(Patient_ID) from patients");
		ResultSet result=ps2.executeQuery();
		
		if(result.next()) {
			id= (Integer)result.getInt(1);
		}
		
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		return id;
	}
	
	///Searching a particular patient corresponding to the ID entered.
	
	public Patient searchPatient(int id) throws SQLException, ClassNotFoundException,NoPatientException{
		con=DatabaseUtil.getConnection();
		Patient patient=null;
		ps=con.prepareStatement("select * from patients where Patient_ID = ? and Status='Active' ");
		
		ps.setInt(1, id);
		ResultSet result = ps.executeQuery();
		
		if(result.next()) {
			patient=new Patient();
			patient.setPatientId(result.getInt("Patient_Id"));
			patient.setPatientName(result.getString("Name"));
			patient.setAge(result.getInt("Age"));
			patient.setDOJ(result.getDate("DOJ"));
			patient.setBedType(result.getString("Bed_Type"));
			patient.setAddress(result.getString("Address"));
			patient.setCity(result.getString("City"));
			patient.setState(result.getString("State"));
		}
		else {
			throw new NoPatientException("No Such Patient");
		}
		
		
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		return patient;
	}
	
	//Updating details of already existing patient.
	public boolean updatePatient(Patient patient) throws SQLException, ClassNotFoundException{
		con=DatabaseUtil.getConnection();
		
		
		ps=con.prepareStatement("update patients set name=?, age=?, DOJ=? ,Bed_Type=? ,Address=? ,City=? ,State=? where patient_id= ? and Status='Active' ");
		
		ps.setString(1, patient.getPatientName());
		ps.setInt(2,patient.getAge());
		ps.setDate(3, new java.sql.Date(patient.getDOJ().getTime()));
		ps.setString(4,patient.getBedType());
		ps.setString(5,patient.getAddress());
		ps.setString(6,patient.getCity());
		ps.setString(7,patient.getState());
		ps.setInt(8, patient.getPatientId());

		
		int count =ps.executeUpdate();
	
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeStatement(ps2);

		if(count>0)
			return true;
		return false;
		
	}
	//Deleting an already existing patient.
	
	public boolean deletePatient(int patientId) throws SQLException, ClassNotFoundException{
		

		con=DatabaseUtil.getConnection();
		
		ps=con.prepareStatement("update patients set status='Inactive' where Patient_id=?");
		
		ps.setInt(1, patientId);
		
		int count=ps.executeUpdate();
		
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		if(count>0)
			return true;
		return false;
	}
	
	//Fetching details of all "Active" patients
	
	public ArrayList<Patient> getAllPatients() throws SQLException, ClassNotFoundException{
		ArrayList<Patient> patientList=new ArrayList<Patient>();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select* from patients where Status='Active' ");
		
		ResultSet result=ps.executeQuery();
		
		while(result.next()) {
			Patient patient=new Patient();
			patient.setPatientId(result.getInt("Patient_Id"));
			patient.setSSNId(result.getInt("SSN_Id"));
			patient.setPatientName(result.getString("Name"));
			patient.setAge(result.getInt("Age"));
			patient.setDOJ(result.getDate("DOJ"));
			patient.setBedType(result.getString("Bed_Type"));
			patient.setAddress(result.getString("Address"));
			patient.setCity(result.getString("City"));
			patient.setState(result.getString("State"));
			
			patientList.add(patient);

		}
		
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		
		return patientList;
	}
	
	//Fetching medicine details of a particular patient searched by the person's id.
	public ArrayList<Object> patientAndMedicine(int patientId) throws SQLException, ClassNotFoundException{
		ArrayList<Object> patientAndMedicine=new ArrayList<Object>();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("Select Patient_Id,Name, Age,Address,DOJ,Bed_type,Medicine_name,Quantity_issued,Rate from patients NATURAL JOIN "
				+ "(Select Medicine_Name,Quantity_Issued,Rate from "
				+ "(Select * from medicines NATURAL JOIN medicine_patient where Patient_Id=?) AS T) As T Where Patient_Id=? and Status='Active'; ");
		
		ps.setInt(1, patientId);
		ps.setInt(2, patientId);

		
		ResultSet result=ps.executeQuery();
		
		while(result.next()) {
			Patient patient=new Patient();
			Medicine medicine=new Medicine();
			patient.setPatientId(result.getInt("Patient_Id"));
			patient.setPatientName(result.getString("Name"));
			patient.setAge(result.getInt("Age"));
			patient.setDOJ(result.getDate("DOJ"));
			patient.setBedType(result.getString("Bed_Type"));
			patient.setAddress(result.getString("Address"));
			
			medicine.setMedicineName(result.getString("Medicine_name"));
			medicine.setQuantity(result.getInt("Quantity_issued"));
			medicine.setRate(result.getInt("Rate"));
			
			
			
			patientAndMedicine.add(patient);
			patientAndMedicine.add(medicine);


		}
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		
		return patientAndMedicine;
	}
	
	//Fetching diagnsotic details of a particular patient searched by the person's id.
	
	public ArrayList<Object> patientAndDiagnostic(int patientId) throws SQLException, ClassNotFoundException{
		ArrayList<Object> patientAndDiagnostic=new ArrayList<Object>();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("Select Patient_Id,Name, Age,Address,DOJ,Bed_type,Test_name,Test_price from patients NATURAL JOIN "
				+ "(Select Test_name,Test_price from (Select * from diagnostics NATURAL JOIN diagnostic_patient where Patient_Id=?)"
				+ " AS T) As T Where Patient_Id=? and Status='Active' ");
		
		ps.setInt(1, patientId);
		ps.setInt(2, patientId);

		
		ResultSet result=ps.executeQuery();
		
		while(result.next()) {
			Patient patient=new Patient();
			Diagnostic diagnostic=new Diagnostic();
			patient.setPatientId(result.getInt("Patient_Id"));
			patient.setPatientName(result.getString("Name"));
			patient.setAge(result.getInt("Age"));
			patient.setDOJ(result.getDate("DOJ"));
			patient.setBedType(result.getString("Bed_Type"));
			patient.setAddress(result.getString("Address"));
			
			diagnostic.setTestName(result.getString("Test_name"));
			diagnostic.setAmount(result.getInt("Test_price"));
			
			
			
			patientAndDiagnostic.add(patient);
			patientAndDiagnostic.add(diagnostic);


		}
		
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		
		return patientAndDiagnostic;
	}
	
	//Fetching diagnostic and medicine details of an "Active" patient corresponding to a patient's Id
	public ArrayList<Object> getPatientBill(int patientId) throws SQLException, ClassNotFoundException{
		ArrayList<Object> patientBill=new ArrayList<Object>();
		con=DatabaseUtil.getConnection();
		
		ps=con.prepareStatement("Select Patient_Id,Name, Age,Address,DOJ,Bed_type from patients Where Patient_Id=? and Status='Active'");
		ps.setInt(1, patientId);

		
		ResultSet result=ps.executeQuery();
		
		while(result.next()) {
			Patient patient=new Patient();

			patient.setPatientId(result.getInt("Patient_Id"));
			patient.setPatientName(result.getString("Name"));
			patient.setAge(result.getInt("Age"));
			patient.setDOJ(result.getDate("DOJ"));
			patient.setBedType(result.getString("Bed_Type"));
			patient.setAddress(result.getString("Address"));
			
			if((patient.getBedType()).equalsIgnoreCase("General Ward"))
				patient.setBill(7*2000);
			if((patient.getBedType()).equalsIgnoreCase("Semi Sharing"))
				patient.setBill(7*4000);
			if((patient.getBedType()).equalsIgnoreCase("Single Room"))
				patient.setBill(7*8000);

			patientBill.add(patient);

		}
		ps2=con.prepareStatement("Select Patient_Id,Name, Age,Address,DOJ,Bed_type,Medicine_name,Quantity_issued,Rate from patients NATURAL JOIN "
				+ "(Select * from medicines NATURAL JOIN medicine_patient where Patient_Id=?) As T Where Patient_Id=? and Status='Active'");
		ps2.setInt(1, patientId);
		ps2.setInt(2, patientId);

		ResultSet result2=ps2.executeQuery();
		
		while(result2.next()) {
			Medicine medicine=new Medicine();
			medicine.setMedicineName(result2.getString("Medicine_name"));
			medicine.setQuantity(result2.getInt("Quantity_issued"));
			medicine.setRate(result2.getInt("Rate"));

			
			patientBill.add(medicine);
		}
		
		ps3=con.prepareStatement("Select Patient_Id,Name, Age,Address,DOJ,Bed_type,Test_name,Test_price from patients NATURAL JOIN "
				+ "(Select * from diagnostics NATURAL JOIN diagnostic_patient where Patient_Id=?) As T Where Patient_Id=? and Status='Active'");
		ps3.setInt(1, patientId);
		ps3.setInt(2, patientId);

		ResultSet result3=ps3.executeQuery();	
		
		while(result3.next()) {
			Diagnostic diagnostic=new Diagnostic();
			
			diagnostic.setTestName(result3.getString("Test_name"));
			diagnostic.setAmount(result3.getInt("Test_price"));

			
			patientBill.add(diagnostic);
		}
		
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeStatement(ps2);
		DatabaseUtil.closeStatement(ps3);

		
		return patientBill;
	}
	
	//Updating the status of a billed patient to discharged
	public boolean setPatientAsDischarged(int id) throws SQLException, ClassNotFoundException{
		con=DatabaseUtil.getConnection();
		boolean isValid=false;
		ps=con.prepareStatement("update patients set status='Discharged' where Patient_id=? and Status='Active'");
		ps.setInt(1, id);
		
		int count=ps.executeUpdate();
		
		if(count>0) {
			isValid=true;
		}
		
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		return isValid;
	}
	public Diagnostic getDiagnosticDetails(String testName) throws SQLException, ClassNotFoundException{
		Diagnostic diagnosticDetails=new Diagnostic();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select Test_Name,Test_Price from diagnostics where Test_Name=?");
		ps.setString(1, testName);
		
		ResultSet result=ps.executeQuery();
		
		while(result.next()) {
			diagnosticDetails.setTestName(result.getString("Test_Name"));
			diagnosticDetails.setAmount(result.getInt("Test_Price"));
		}
		
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(ps);
		return diagnosticDetails;
	}
	
	}
