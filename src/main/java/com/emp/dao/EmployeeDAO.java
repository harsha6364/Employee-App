package com.emp.dao;

import java.util.List;

import com.emp.dto.Employee;


public interface EmployeeDAO {
	
	void addEmployee(Employee e); // CREATE
	
	Employee findById(Integer id); //READ
	
	List<Employee> findAll(); //READ
	
	Employee findByMailAndPassword(String mail, String Password); // READ
	
	void updateEmployee(Employee e); //UPADTE
	
	void updatePassword(Employee e); //Reset Password
	
	void deleteById(Integer id); //DELETE
	
	Employee findByMail(String mail);

}
