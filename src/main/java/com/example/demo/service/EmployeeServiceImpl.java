package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.repository.EmployeeRepository;
import com.example.demo.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EmployeeServiceImpl implements EmployeeService {

	private final EmployeeRepository employeeRepository;
	
	@Autowired
	public EmployeeServiceImpl(EmployeeRepository theEmployeeRepository) {
		employeeRepository = theEmployeeRepository;
	}

	@Override
	public List<Employee> findAll() {
		return employeeRepository.findAllByOrderByFirstNameAsc();
	}

	@Override
	public List<Employee> findByName(String first_name) {
		return employeeRepository.findByFirstNameIgnoreCaseContaining(first_name);
	}

	@Override
	public Employee findById(int theId) {
		Optional<Employee> result = employeeRepository.findById(theId);
		
		Employee theEmployee;
		
		if (result.isPresent()) {
			theEmployee = result.get();
		}
		else {
			
			throw new RuntimeException("Did not find employee id - " + theId);
		}
		
		return theEmployee;
	}

	@Override
	public void save(Employee theEmployee) {
		employeeRepository.save(theEmployee);
	}

	@Override
	public void deleteById(int theId) {
		employeeRepository.deleteById(theId);
	}

}






