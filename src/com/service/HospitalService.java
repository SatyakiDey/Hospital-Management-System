package com.service;

import java.sql.SQLException; 
import com.dao.*;
import com.CustomException.NoPatientException;
import com.bean.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class HospitalService {

	HospitalDao cDao= new HospitalDao();
	
	
	public boolean validateLogin(String username,String password) throws SQLException, ClassNotFoundException{
		
		return cDao.validateLogin(username,password);
	}
	
	public int addPatient(Patient patient) throws SQLException, ClassNotFoundException{
			
			return cDao.addPatient(patient);
		}
	
	public Patient getPatientById(int id) throws SQLException, ClassNotFoundException,NoPatientException{
		
		return cDao.searchPatient(id);
	} 
	
	public ArrayList<Object> patientAndDiagnostic(int patientId) throws SQLException, ClassNotFoundException{
		
		return cDao.patientAndDiagnostic(patientId);
	} 
	
	public ArrayList<Object> patientAndMedicine(int patientId) throws SQLException, ClassNotFoundException{
		
		return cDao.patientAndMedicine(patientId);
	} 
	
	public boolean setPatientAsDischarged(int id) throws SQLException, ClassNotFoundException{
		
		return cDao.setPatientAsDischarged(id);
	}
	
	public ArrayList<Object> getPatientBill(int patientId) throws SQLException, ClassNotFoundException{
		
		return cDao.getPatientBill(patientId);
	} 
	
	public boolean updatePatient(Patient patient) throws SQLException, ClassNotFoundException{
		
		return cDao.updatePatient(patient);
	}
	
	public boolean deletePatient(int id) throws SQLException, ClassNotFoundException{
		
		return cDao.deletePatient(id);
	}
	
	public ArrayList<Patient> getAllPatients() throws SQLException, ClassNotFoundException{
		
		return cDao.getAllPatients();
	}
	
	public Diagnostic getDiagnosticDetails(String testName) throws SQLException, ClassNotFoundException{
		
		return cDao.getDiagnosticDetails(testName);
	}

}
