package com.example.demo.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.entity.Employee;
import com.example.demo.service.EmployeeService;

@Controller
@RequestMapping("/export")
public class ExportController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/csv")
    public void exportToCsv( HttpServletResponse response) throws Exception {
        // get the employees with the given name
        List<Employee> employees = employeeService.findAll();

        // set the response headers
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"employees.csv\"");

        // write the data to the response
        CSVPrinter csvPrinter = new CSVPrinter(response.getWriter(), CSVFormat.DEFAULT);
        csvPrinter.printRecord("Id", "First Name", "Address");
        for (Employee employee : employees) {
            csvPrinter.printRecord(employee.getId(), employee.getFirstName(), employee.getAddress());
        }
        csvPrinter.close();
    }
}
