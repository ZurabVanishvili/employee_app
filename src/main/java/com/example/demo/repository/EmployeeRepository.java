package com.example.demo.repository;

import java.util.List;

import com.example.demo.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;


@Repository

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {


	List<Employee> findAllByOrderByFirstNameAsc();
	List<Employee> findByFirstNameIgnoreCaseContaining(String first_name);


}
