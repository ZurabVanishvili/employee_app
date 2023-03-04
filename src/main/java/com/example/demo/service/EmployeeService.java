package com.example.demo.service;

import com.example.demo.entity.Employee;

import java.util.List;



public interface EmployeeService {

	 List<Employee> findAll();

	 List<Employee> findByName(String first_name);

	 Employee findById(int theId);
	
	 void save(Employee theEmployee);
	
	 void deleteById(int theId);
	
}
